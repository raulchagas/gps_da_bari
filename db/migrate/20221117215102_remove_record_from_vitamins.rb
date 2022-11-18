class RemoveRecordFromVitamins < ActiveRecord::Migration[7.0]
  def change
    remove_column :vitamins, :record
  end
end
