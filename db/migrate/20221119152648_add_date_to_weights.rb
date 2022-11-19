class AddDateToWeights < ActiveRecord::Migration[7.0]
  def change
    add_column :weights, :date, :date
  end
end
