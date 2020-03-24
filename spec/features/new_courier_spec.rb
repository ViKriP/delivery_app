require 'rails_helper'

RSpec.feature "NewCouriers", type: :feature do
  given(:valid_attributes) { attributes_for(:courier) }

  scenario 'Successful courier creation through the creation form' do
    visit new_courier_path
    within '#new_courier' do
      fill_in 'courier[name]', with: valid_attributes[:name]
      fill_in 'courier[email]', with: valid_attributes[:email]
      click_button(I18n.t('create'))
    end

    expect(page).to have_content I18n.t('courier_cr')
  end

  scenario 'Failed courier creation through creation form' do
    visit new_courier_path
    within '#new_courier' do
      fill_in 'courier[name]', with: ''
      fill_in 'courier[email]', with: valid_attributes[:email]
      click_button(I18n.t('create'))
    end

    expect(page).to have_content I18n.t('courier_cr_err')
  end
end
