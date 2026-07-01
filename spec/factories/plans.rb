FactoryBot.define do
  factory :plan do
    active { true }
    duration_days { 30 }
    name_plan { "Plano Padrão" }
    price { "99.99" }
  end
end
