require 'rails_helper'

RSpec.feature "EditCouriers", type: :feature do
  given!(:courier) { create(:courier) }
  given(:valid_attributes) { attributes_for(:courier) }

  scenario 'Form already filled with user data' do
    visit edit_courier_path(courier.id)

    expect(page).to have_content I18n.t('edit_courier')
    expect(page).to have_field 'courier[name]', with: courier.name
    expect(page).to have_field 'courier[email]', with: courier.email
  end

  scenario 'Successful updating a courier through the updating form' do
    visit edit_courier_path(courier.id)

    within "#edit_courier_#{courier.id}" do
      fill_in 'courier[name]', with: valid_attributes[:name]
      fill_in 'courier[email]', with: valid_attributes[:email]

      click_button(I18n.t('save'))
    end

    expect(page).to have_content I18n.t('courier_upd')
  end

  scenario 'Failed courier updating through updating form' do
    visit edit_courier_path(courier.id)

    within "#edit_courier_#{courier.id}" do
      fill_in 'courier[name]', with: ''
      fill_in 'courier[email]', with: valid_attributes[:email]

      click_button(I18n.t('save'))
    end

    expect(page).to have_content I18n.t('courier_upd_err')
  end
end
