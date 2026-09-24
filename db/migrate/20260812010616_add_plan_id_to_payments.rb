class AddPlanIdToPayments < ActiveRecord::Migration[8.1]
  def change
    add_reference :payments, :plan, null: false, foreign_key: true
  end
end
