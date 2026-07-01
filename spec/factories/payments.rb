FactoryBot.define do
  factory :payment do
    amount { FAKER::Commerce.price(ranger: 50..200) }
    due_date { Faker::Date.in_date_period(month: 1) }
    payment_method { "Pix" }
    status { true }

    association :student
  end
end
