class AddDateDueToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :date_due, :datetime
  end
end
