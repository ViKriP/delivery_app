require 'rails_helper'

RSpec.describe ApplicationHelper, type: :helper do
  let(:courier) { create(:courier) }

  before { courier.errors.messages[:name] << "can't be blank" }

  describe '#show_errors' do
    it 'returns the error message' do
      expect(helper.show_errors(courier, :name)).to eq "can't be blank"
    end

    it 'returns nil' do
      obj = nil
      expect(helper.show_errors(obj, :name)).to eql nil
    end
  end

  describe '#error_class' do
    it 'returns the css class' do
      expect(helper.error_class(courier, :name)).to eq 'has-error'
    end

    it 'returns nil' do
      obj = nil
      expect(helper.error_class(obj, :name)).to eql nil
    end
  end
end
