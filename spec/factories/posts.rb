FactoryGirl.define do
  factory :post do
    association :author, factory: :user
    body Faker::Lorem.sentence
    title Faker::Lorem.sentence
    published_at '2017-10-05 14:48:45'
  end
end
