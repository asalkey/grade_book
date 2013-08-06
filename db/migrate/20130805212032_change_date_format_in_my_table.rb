class ChangeDateFormatInMyTable < ActiveRecord::Migration
  def change
    change_column :assignments, :grade, :integer
  end
end
