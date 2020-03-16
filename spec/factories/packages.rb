FactoryBot.define do
  factory :package do
    sequence(:track_number) { |n| "test#{n}@gmail.com" }
    delivery_status { false }
  end
end
