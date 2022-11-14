class RemoveTakenFromVitamins < ActiveRecord::Migration[7.0]
  def change
    remove_column :vitamins, :taken
  end
end
