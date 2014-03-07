class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :name
      t.boolean :complete
      t.boolean :starred
      t.references :list, index: true

      t.timestamps
    end
  end
end
