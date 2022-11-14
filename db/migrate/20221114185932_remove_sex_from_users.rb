class RemoveSexFromUsers < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :sex
  end
end
