class AddnameplanToPayments < ActiveRecord::Migration[8.1]
  def change
    add_column :payments, :name_plan_payment, :string
  end
end
