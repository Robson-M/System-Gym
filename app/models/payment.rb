class Payment < ApplicationRecord
    belongs_to :student
    belongs_to :plan

    before_save :calculate
    validate :zero_day_condition, on: :create

    def last_payment
        student.payments.order(created_at: :desc).first
    end

    def due_date_active
        return "Pendente" unless last_payment&.due_date
        last_payment.due_date > Date.today ? "Ativo" : "Pendente"
    end

    def days_until_expiration
        return 0 unless last_payment&.due_date
        (last_payment.due_date - Date.today).to_i
    end

    private
    
    def calculate
        plan = Plan.find(plan_id)
        self.name_plan_payment = plan.name_plan
        self.amount = plan.price
        self.due_date = Date.today + plan.duration_days.days
        self.paid_at = Date.today
    end

    def zero_day_condition
        return unless last_payment.present?
        return unless last_payment.due_date.present?

        if last_payment.due_date > Date.today
            errors.add(:base, "Novo pagamento só pode ser feito após o vencimento. Faltam #{days_until_expiration} dia(s).")
        end
    end
end
