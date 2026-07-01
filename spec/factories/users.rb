FactoryBot.define do
  factory :user do
    cpf { Faker::IdNumber.brazilian_citizen_number }
    password_digest { "1234567" }
    role { "admin" }
  end
end
