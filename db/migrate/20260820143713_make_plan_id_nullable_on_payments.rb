class MakePlanIdNullableOnPayments < ActiveRecord::Migration[8.1]
  def change
    change_column_null :payments, :plan_id, true
  end
end
