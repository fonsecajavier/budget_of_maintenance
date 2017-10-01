class CreateEquipmentTypes < ActiveRecord::Migration[5.1]
  def change
    create_table :equipment_types do |t|
      t.string :name, null: :false
      t.references :workspace, foreign_key: true

      t.timestamps
    end
  end
end
