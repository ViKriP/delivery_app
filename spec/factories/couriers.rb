FactoryBot.define do
  factory :courier do
    name { FFaker::NameRU.first_name }
    sequence(:email) { |n| "test#{n}@gmail.com" }
  end
end
