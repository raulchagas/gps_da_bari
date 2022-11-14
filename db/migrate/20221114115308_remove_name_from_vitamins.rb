class RemoveNameFromVitamins < ActiveRecord::Migration[7.0]
  def change
    remove_column :vitamins, :name
  end
end
