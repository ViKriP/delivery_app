require 'rails_helper'

RSpec.describe CouriersController, type: :controller do
  describe 'GET #index' do
    let(:package) { create(:package) }
    let!(:courier_package) { create(:courier_package, package: package) }

    before { get :index }

    it { expect(response).to render_template :index }

    it 'responds with success status' do
      expect(response.status).to eq(200)
    end

    it 'assigns the couriers to @couriers' do
      sorted_couriers = Courier.all.order(:name)

      expect(assigns(:couriers).first.id).to eql sorted_couriers.first.id
    end
  end

  describe 'GET #show' do
    let(:courier) { create(:courier) }
    let(:param) { { id: courier.id } }

    before { get :show, params: param }

    it { expect(response).to render_template :show }

    it 'responds with success status' do
      expect(response.status).to eq(200)
    end

    it 'assigns the courier to @courier' do
      expect(assigns(:courier).id).to eql courier.id
    end

    it 'assigns the package to @package' do
      expect(assigns(:package)).to be_a Package
    end
  end

  describe 'GET #new' do
    before { get :new }

    it { expect(response).to render_template :new }

    it 'responds with success status' do
      expect(response.status).to eq(200)
    end

    it 'assigns the courier to @courier' do
      expect(assigns(:courier)).to be_a Courier
    end
  end

  describe 'GET #edit' do
    let(:courier) { create(:courier) }
    let(:param) { { id: courier.id } }

    before { get :edit, params: param }

    it { expect(response).to render_template :edit }

    it 'responds with success status' do
      expect(response.status).to eq(200)
    end

    it 'assigns the courier to @courier' do
      expect(assigns(:courier).id).to eql courier.id
    end
  end

  describe 'POST #create' do
    context 'when invalid data' do
      let(:invalid_post_action) { post :create, params: { courier: attributes_for(:courier, name: '') } }

      before { invalid_post_action }

      it 'does not save courier' do
        expect{ invalid_post_action }.not_to change(Courier, :count)
      end

      it 'render to action new' do
        expect(subject).to render_template(:new)
      end

      it 'sends alert notice' do
        expect(flash[:alert]).to eq I18n.t('courier_cr_err')
      end
    end

    context 'when valid data' do
      let(:valid_post_action) { post :create, params: { courier: attributes_for(:courier) } }

      it 'saves courier' do
        expect{ valid_post_action }.to change(Courier, :count).by(1)
      end

      it 'sends success notice' do
        valid_post_action
        expect(flash[:notice]).to eq I18n.t('courier_cr')
      end
    end
  end

  describe 'PATCH #update' do
    let!(:courier) { create(:courier) }

    context 'when invalid data' do
      let(:invalid_path_action) { patch :update, params: { id: courier.id, courier: { name: '', email: '' } } }

      before { invalid_path_action }

      it 'does not save courier' do
        expect{ invalid_path_action }.not_to change(Courier, :count)
      end

      it 'render to edit courier' do
        expect(subject).to render_template(:edit)
      end

      it 'sends alert notice' do
        expect(flash[:alert]).to eq I18n.t('courier_upd_err')
      end
    end

    context 'when valid data' do
      let(:test_name) { FFaker::NameRU.first_name }
      let(:valid_patch_action) { patch :update, params: { id: courier.id, courier: attributes_for(:courier, name: test_name) } }

      before { valid_patch_action }

      it 'updates courier' do
        expect(Courier.find_by(id: courier.id).name).to eql test_name
      end

      it 'sends success notice' do
        expect(flash[:notice]).to eq I18n.t('courier_upd')
      end
    end
  end
end
