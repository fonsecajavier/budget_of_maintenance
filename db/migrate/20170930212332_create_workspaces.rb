class CreateWorkspaces < ActiveRecord::Migration[5.1]
  def change
    create_table :workspaces do |t|
      t.string :name, null: false
      t.integer :default_interval_of_maintenance, null: false

      t.timestamps
    end
  end
end
