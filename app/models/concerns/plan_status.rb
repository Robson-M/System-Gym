module PlanStatus
    extend ActiveSupport::Concern

    included do
        validate :plan_must_be_active, if: :will_save_change_to_plan_id?
    end

    private

    def plan_must_be_active
        return if plan.nil?

       errors.add(:base, "Plano inativo, selecione outro plano!") if plan.active == false
    end
end