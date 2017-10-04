class RemoveDefaultMonthlyUsageFromWorkspaces < ActiveRecord::Migration[5.1]
  def change
    remove_column :workspaces, :default_monthly_usage, :integer
  end
end
