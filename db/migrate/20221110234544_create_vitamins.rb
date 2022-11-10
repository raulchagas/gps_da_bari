class CreateVitamins < ActiveRecord::Migration[7.0]
  def change
    create_table :vitamins do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name
      t.string :dosage
      t.text :description
      t.boolean :taken
      t.datetime :date

      t.timestamps
    end
  end
end
