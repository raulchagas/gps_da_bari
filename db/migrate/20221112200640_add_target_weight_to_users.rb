class AddTargetWeightToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :target_weigth, :float
  end
end
