class ChangeDataTypeForData < ActiveRecord::Migration[7.0]
  def change
    change_column(:vitamins, :date, :date)
  end
end
