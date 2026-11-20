FactoryBot.define do
  factory :user do
    cpf { "12345678910" }
    password { 12345678 }
    password_confirmation { 12345678 }
    name_user { "Robson Mesquita Dos Santos" }
    phone_user { "00000000000" }
  end
end
