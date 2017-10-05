FactoryGirl.define do
  factory :post do
    body Faker::Lorem.sentence
    title Faker::Lorem.sentence
    published_at '2017-10-05 14:48:45'
    association :author, factory: :user

    factory :post_with_comments do
      transient do
        comments_count 10
      end

      after(:create) do |post, evaluator|
        create_list(:comment, evaluator.comments_count, post: post)
      end
    end
  end
end
