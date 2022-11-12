class FixTargetWeigth < ActiveRecord::Migration[7.0]
  def change
    rename_column :users, :target_weigth, :target_weight
  end
end
