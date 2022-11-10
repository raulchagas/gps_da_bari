class CreateWeights < ActiveRecord::Migration[7.0]
  def change
    create_table :weights do |t|
      t.float :value

      t.timestamps
    end
  end
end
