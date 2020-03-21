require 'rails_helper'

RSpec.describe PackagesController, type: :controller do
  describe 'POST #create' do
    let(:courier) { create(:courier) }

    context 'when invalid data' do
      let(:invalid_post_action) { post :create, params: { courier_id: courier.id, package: attributes_for(:package, tracking_number: '') } }

      before { invalid_post_action }

      it 'does not save courier' do
        expect{ invalid_post_action }.not_to change(Package, :count)
      end

      it 'render to action new' do
        expect(subject).to redirect_to courier
      end

      it 'sends alert notice' do
        expect(flash[:alert]).to eq I18n.t('package_cr_err')
      end
    end

    context 'when valid data' do
      let(:test_tracking_number) { 'P005' }
      let(:valid_post_action) { post :create, params: { courier_id: courier.id, package: attributes_for(:package, tracking_number: test_tracking_number) } }

      it 'saves courier' do
        expect{ valid_post_action }.to change(Package, :count).by(1)
      end

      it 'sends success notice' do
        valid_post_action
        expect(flash[:notice]).to eq I18n.t('package_cr',
                                            tracking_number: test_tracking_number,
                                            courier: courier.name)
      end
    end
  end
end
