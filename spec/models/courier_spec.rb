require 'rails_helper'

RSpec.describe Courier, type: :model do
  it { should have_many(:packages).through(:courier_packages) }

  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:email) }
end
