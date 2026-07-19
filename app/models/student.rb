class Student < ApplicationRecord
    belongs_to :plan
    has_many :payments, dependent: :destroy

    validates :name_student, presence: true
    validates :phone, length: { is: 11 }
end
