class CheckDueDatesJob < ApplicationJob
  queue_as :default

  def perform
    Student.find_each do |student|
      last_payments = student.payments.order(due_date: :desc).first
      next unless last_payments

      if last_payments.due_date < Date.today
        student.update(status: false)
      else
        student.update(status: true)
      end
    end
  end
end
