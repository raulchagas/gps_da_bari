class CreateBodyFats < ActiveRecord::Migration[7.0]
  def change
    create_table :body_fats do |t|
      t.float :value
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
