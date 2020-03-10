class CourierPackage < ApplicationRecord
  belongs_to :courier
  belongs_to :package
end
