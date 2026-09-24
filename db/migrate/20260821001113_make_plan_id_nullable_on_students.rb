class MakePlanIdNullableOnStudents < ActiveRecord::Migration[8.1]
  def change
    change_column_null :students, :plan_id, true
    remove_foreign_key :students, :plans
  end
end
