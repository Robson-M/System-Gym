class AddEnderecoToStudents < ActiveRecord::Migration[8.1]
  def change
    add_column :students, :neighborhood, :string
    add_column :students, :street, :string
    add_column :students, :house_number, :integer
  end
end
