class CreatePlans < ActiveRecord::Migration[8.1]
  def change
    create_table :plans, if_not_exists: true do |t|
      t.string :name_plan, null: false
      t.integer :duration_days
      t.decimal :price, null: false
      t.boolean :active

      t.timestamps
    end
  end
end
