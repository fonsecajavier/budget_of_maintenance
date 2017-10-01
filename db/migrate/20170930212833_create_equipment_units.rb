class CreateEquipmentUnits < ActiveRecord::Migration[5.1]
  def change
    create_table :equipment_units do |t|
      t.string :name, null: false
      t.references :equipment_type, foreign_key: true

      t.timestamps
    end
  end
end
