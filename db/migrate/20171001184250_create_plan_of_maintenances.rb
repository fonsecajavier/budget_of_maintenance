class CreatePlanOfMaintenances < ActiveRecord::Migration[5.1]
  def change
    create_table :plan_of_maintenances do |t|
      t.string :name, null: false
      t.references :equipment_type, null: false
      t.integer :interval, null: false

      t.timestamps
    end
  end
end
