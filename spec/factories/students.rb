FactoryBot.define do
  factory :student do
    name_student { Faker::Name.full_name }
    phone { Faker::PhoneNumber.cell_phone }
    birth_date { Faker::Date.birthday(min_age: 16, max_age: 80) }
    status { true }
    association :user
    association :plan
  end
end