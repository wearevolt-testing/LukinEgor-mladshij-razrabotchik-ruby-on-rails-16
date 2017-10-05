FactoryGirl.define do
  factory :user do
    sequence :nickname do |n|
      "#{Faker::Name.unique.name}-#{n}"
    end
    sequence :email do |n|
      "person#{n}@example.com"
    end
    password 'qwerty'
  end
end
