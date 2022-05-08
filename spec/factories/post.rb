FactoryBot.define do
  factory :post do
    title { Faker::Lorem.characters(number:10) }
    comment { Faker::Lorem.characters(number:30) }
  end
end