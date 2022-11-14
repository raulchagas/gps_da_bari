class RemoveDosageFromVitamins < ActiveRecord::Migration[7.0]
  def change
    remove_column :vitamins, :dosage
  end
end
