FactoryBot.define do
  factory :student do
    name_student { Faker::Name.name }
    phone { 77988502106 }
    birth_date { Faker::Date.birthday(min_age: 16, max_age: 80) }
    status { true }
    association :user
    association :plan
  end
end
