class ChangeStatusInGoals < ActiveRecord::Migration[7.0]
  def up
    change_column :goals, :status, :boolean, default: false, null: false
  end

  def down
    change_column :goals, :status, :boolean
  end
end
