class CreateGoals < ActiveRecord::Migration[7.0]
  def change
    create_table :goals do |t|
      t.references :user, null: false, foreign_key: true
      t.text :description
      t.boolean :status

      t.timestamps
    end
  end
end
