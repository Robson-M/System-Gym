class AddProfileFieldsToUsers < ActiveRecord::Migration[8.1]
  def change
    add_column :users, :name_user, :string
    add_column :users, :phone_user, :string
    add_column :users, :birth_date_user, :date
  end
end
