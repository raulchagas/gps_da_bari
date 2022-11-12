class AddWeightBeforeSurgeryToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :weight_before_surgery, :float
  end
end
