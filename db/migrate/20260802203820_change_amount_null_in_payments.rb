class ChangeAmountNullInPayments < ActiveRecord::Migration[8.1]
  def change
    change_column_null :payments, :amount, true
  end
end
