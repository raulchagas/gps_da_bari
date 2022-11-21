class AddDateToBodyFats < ActiveRecord::Migration[7.0]
  def change
    add_column :body_fats, :date, :date
  end
end
