FactoryGirl.define do
  factory :user do
    nickname Faker::Name.unique.name
    sequence :email do |n|
      "person#{n}@example.com"
    end
    password 'qwerty'
  end
end
