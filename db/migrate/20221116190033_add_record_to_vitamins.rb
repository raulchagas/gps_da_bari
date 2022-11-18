class AddRecordToVitamins < ActiveRecord::Migration[7.0]
  def change
    add_column :vitamins, :record, :integer
  end
end
