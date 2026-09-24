class CreateAcademy < ActiveRecord::Migration[8.1]
  def change
    create_table :academies do |t|
      t.string :gym_name, null: false
      t.string :gym_phone
      t.string :gym_email
      t.string :gym_address

      t.timestamps
    end
  end
end
