class CreateAssignments < ActiveRecord::Migration
  def change
    create_table :assignments do |t|
      t.string :name
      t.string :grade
      t.references :course
      t.timestamps
    end
  end
end
