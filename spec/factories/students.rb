FactoryBot.define do
  factory :student do
    name_student { "Claudinei carvalho" }
    phone { 11111111111 }
    birth_date { 35 }
    status { true }
    association :plan
  end
end
