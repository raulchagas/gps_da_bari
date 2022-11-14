class ChangeDataTypeForDateOfSurgery < ActiveRecord::Migration[7.0]
  def change
    change_column(:users, :date_of_surgery, :date)
  end
end
