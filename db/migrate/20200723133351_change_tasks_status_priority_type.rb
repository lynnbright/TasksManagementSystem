class ChangeTasksStatusPriorityType < ActiveRecord::Migration[6.0]
  def change
    Task.where(status: '待處理').update_all(status: 0)
    Task.where(status: '進行中').update_all(status: 1)
    Task.where(status: '已完成').update_all(status: 2)
    Task.where(priority: '低').update_all(priority: 0)
    Task.where(priority: '中').update_all(priority: 1)
    Task.where(priority: '高').update_all(priority: 2)
    change_column :tasks, :status, :integer, using: 'status::integer'
    change_column :tasks, :priority, :integer, using: 'priority::integer'
  end
end
