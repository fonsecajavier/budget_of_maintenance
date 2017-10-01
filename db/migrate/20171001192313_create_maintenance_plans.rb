class CreateMaintenancePlans < ActiveRecord::Migration[5.1]
  def change
    create_table :maintenance_plans do |t|
      t.string :name, null: false
      t.references :equipment_type, null: false
      t.decimal :cost, precision: 16, scale: 2, null: false
      t.integer :interval, null: false

      t.timestamps
    end
  end
end
