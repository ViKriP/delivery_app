class Package < ApplicationRecord
  has_one :courier_packages
  has_one :packages, through: :courier_packages

  validates :tracking_number, presence: true
end
