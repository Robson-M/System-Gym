class CreatePayments < ActiveRecord::Migration[8.1]
  def change
    create_table :payments do |t|
      t.decimal :amount, null: false
      t.boolean :status
      t.date :due_date
      t.date :paid_at
      t.string :payment_method
      t.references :student, null: false, foreign_key: true

      t.timestamps
    end
  end
end
