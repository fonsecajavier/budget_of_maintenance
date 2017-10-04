class AddMonthlyUsageToEquipmentUnits < ActiveRecord::Migration[5.1]
  def change
    add_column :equipment_units, :monthly_usage, :integer, null: false
  end
end
