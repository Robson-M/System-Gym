FactoryBot.define do
  factory :payment do
    amount { 100 }
    payment_method { "Pix" }
    status { true }
    association :plan
    association :student
  end
end
