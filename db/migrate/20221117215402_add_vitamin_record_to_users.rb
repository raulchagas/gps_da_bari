class AddVitaminRecordToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :vitamin_record, :integer
  end
end
