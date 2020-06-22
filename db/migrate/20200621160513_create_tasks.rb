class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
      t.string :title
      t.text :description
      t.string :status
      t.string :priority
      t.datetime :start_at
      t.datetime :end_at
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
