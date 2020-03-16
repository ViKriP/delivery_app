require 'rails_helper'

RSpec.describe CourierPackage, type: :model do
  it { is_expected.to belong_to(:courier) }
  it { is_expected.to belong_to(:package) }
end
