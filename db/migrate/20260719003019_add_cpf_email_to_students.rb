class AddCpfEmailToStudents < ActiveRecord::Migration[8.1]
  def change
    add_column :students, :cpf_student, :string
    add_column :students, :email_student, :string
  end
end
