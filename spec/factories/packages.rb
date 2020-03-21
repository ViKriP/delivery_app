FactoryBot.define do
  factory :package do
    sequence(:tracking_number) { |n| "P00#{n}" }
    delivery_status { false }
  end
end
