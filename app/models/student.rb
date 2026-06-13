class Student < ApplicationRecord
    belongs_to :user
    belongs_to :plan
    has_one :payments, dependent: :destroy

    validates :phone, length: { is: 11 }
end
