class ChangeStatusToBooleanInStudents < ActiveRecord::Migration[8.1]
  def change
    change_column :students, :status, :boolean, using: 'status::boolean'
  end
end
