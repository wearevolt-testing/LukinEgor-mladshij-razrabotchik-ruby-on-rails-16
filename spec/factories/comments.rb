FactoryGirl.define do
  factory :comment do
    body Faker::Lorem.sentence
    published_at DateTime.now
    post
  end
end
