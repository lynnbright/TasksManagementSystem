class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
      t.string :title
      t.text :description
      t.datetime :start_at
      t.datetime :end_at
      t.string :status
      t.string :priority
      t.string :search_task

      t.timestamps
    end
  end
end
