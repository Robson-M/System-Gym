class CheckDueDatesJob < ApplicationJob
  queue_as :default

  def perform
    Student.find_each(&:refresh_status!)
  end
end
