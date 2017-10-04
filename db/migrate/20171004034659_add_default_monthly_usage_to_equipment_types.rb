class AddDefaultMonthlyUsageToEquipmentTypes < ActiveRecord::Migration[5.1]
  def change
    add_column :equipment_types, :default_monthly_usage, :integer
  end
end
