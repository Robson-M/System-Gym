class CheckDueDatesJob < ApplicationJob
  queue_as :default

  def perform
    Student.find_each(&:refre)
  end
end
