class AddDateOfSurgeryToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :date_of_surgery, :datetime
  end
end