class Courier < ApplicationRecord
  has_many :courier_packages
  has_many :packages, through: :courier_packages

  validates :name, :email, presence: true

end
