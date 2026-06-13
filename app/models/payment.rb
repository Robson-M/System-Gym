class Payment < ApplicationRecord
    belongs_to :student

    before_save :calculate_due_date
    
    before_save :comparasion

    def active?
        return false if due_date.nil?
        due_date > Date.current
    end

    private

    def calculate_due_date
        self.due_date = Date.current + student.plan.duration_days.days
    end 

    def comparasion
        self.status = amount == student.plan.price
    end
end
