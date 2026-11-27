class Student < ApplicationRecord
    include PlanStatus
    belongs_to :plan
    has_many :payments, dependent: :destroy

    # Avisos do sino no header
    scope :birthdays_on, ->(date) {
        where("EXTRACT(MONTH FROM birth_date) = ? AND EXTRACT(DAY FROM birth_date) = ?", date.month, date.day)
    }
    scope :created_on, ->(date) { where(created_at: date.all_day) }

    def refresh_status!
        last_payment = payments.order(due_date: :desc).first
        return unless last_payment

        update(status: last_payment.due_date >= Date.today)
    end

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
