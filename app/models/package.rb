class Package < ApplicationRecord
  has_many :courier_packages
  has_many :couriers, through: :courier_packages

  validates :tracking_number, presence: true
end
