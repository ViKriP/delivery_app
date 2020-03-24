require 'rails_helper'

RSpec.feature "ListCouriers", type: :feature do
  context 'When the courier is there' do
    given!(:couriers) { create_list(:courier, 5) }

    scenario 'Page elements and content' do
      visit root_path

      expect(page).to have_content I18n.t('couriers')
      expect(page).to have_content couriers[0].name
      expect(page).to have_link(I18n.t('new_courier'))
      expect(page).to have_link(I18n.t('show'))
      expect(page).to have_link(I18n.t('edit'))
    end

    scenario 'Clicked link to new courier' do
      visit root_path

      click_link(I18n.t('new_courier'))
      expect(page).to have_content(I18n.t('new_courier'))
      expect(page).to have_field 'courier[name]'
      expect(page).to have_field 'courier[email]'
    end

    scenario 'Clicked link to show courier' do
      visit root_path

      first(:link, I18n.t('show')).click
      expect(page).to have_content(I18n.t('courier'))
    end

    scenario 'Clicked link to edit courier' do
      visit root_path

      first(:link, I18n.t('edit')).click
      expect(page).to have_content(I18n.t('edit_courier'))
    end
  end

  context 'when there are no couriers' do
    scenario 'Page elements and content' do
      visit root_path

      expect(page).to have_content I18n.t('couriers')
      expect(page).to have_link(I18n.t('new_courier'))
      expect(page).to have_content I18n.t('no_couriers')
    end
  end
end
