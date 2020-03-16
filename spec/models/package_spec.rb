require 'rails_helper'

RSpec.describe Package, type: :model do
  it { should have_many(:couriers).through(:courier_packages) }

  it { is_expected.to validate_presence_of(:tracking_number) }
end
