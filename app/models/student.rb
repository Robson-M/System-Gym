class Student < ApplicationRecord
    include PlanStatus
    belongs_to :plan
    has_many :payments, dependent: :destroy

    def status_student
        if status == true
            "Ativo"
        else
            "Pendente"
        end
    end

    def last_payment_student
        payments.order(paid_at: :desc).first
    end

    validates :name_student, presence: true
    validates :phone, length: { is: 11 }
    validates :cpf_student, presence: true
    validates :cpf_student, length: { is: 11 }, uniqueness: true, allow_blank: true
end
