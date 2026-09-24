class RemovePlanForeignKeyFromPayments < ActiveRecord::Migration[8.1]
  def change
    remove_foreign_key :payments, :plans
  end
end
