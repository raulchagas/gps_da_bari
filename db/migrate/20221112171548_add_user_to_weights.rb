class AddUserToWeights < ActiveRecord::Migration[7.0]
  def change
    add_reference :weights, :user, null: false, foreign_key: true
  end
end
