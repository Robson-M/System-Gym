class RenameAcademiesToAcademy < ActiveRecord::Migration[8.1]
  def change
    rename_table :academies, :gyms
  end
end
