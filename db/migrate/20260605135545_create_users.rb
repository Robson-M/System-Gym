class CreateUsers < ActiveRecord::Migration[8.1]
  def change
    create_table :users do |t|
      t.string :cpf, null: false
      t.string :password_digest, null: false
      t.string :role, null: false

      t.timestamps
    end

    add_index :users, :cpf, unique: true
  end
end
