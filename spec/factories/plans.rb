FactoryBot.define do
  factory :plan do
    active { false }
    duration_days { 1 }
    name_plan { "MyString" }
    price { "9.99" }
  end
end
