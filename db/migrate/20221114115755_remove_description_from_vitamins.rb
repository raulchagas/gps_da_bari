class RemoveDescriptionFromVitamins < ActiveRecord::Migration[7.0]
  def change
    remove_column :vitamins, :description
  end
end
