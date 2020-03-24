require 'rails_helper'

RSpec.feature "NewPackages", type: :feature do
  given!(:courier) { create(:courier) }
  given(:valid_attributes) { attributes_for(:package) }

  scenario 'Successful package creation through the creation form' do
    visit courier_path(courier.id)

    within '#new_package' do
      fill_in 'package[tracking_number]', with: valid_attributes[:tracking_number]
      page.uncheck('package[delivery_status]')

      click_button(I18n.t('create'))
    end

    expect(page).to have_content I18n.t('package_cr', tracking_number: valid_attributes[:tracking_number], courier: courier.name)
    expect(page).to have_content "#{I18n.t('delivered')} 0"
    expect(page).to have_content "#{I18n.t('undelivered')} 1"
  end

  scenario 'Failed package creation through creation form' do
    visit courier_path(courier.id)

    within '#new_package' do
      fill_in 'package[tracking_number]', with: ''
      page.check('package[delivery_status]')
      click_button(I18n.t('create'))
    end

    expect(page).to have_content I18n.t('package_cr_err')
  end
end
