class Task < ApplicationRecord
  validates :title, presence: true
  validates :status, presence: true, inclusion: { in: %w(todo doing done) }
  validates :priority, presence: true, inclusion: { in: %w(low mid high) }
  validates :start_at, presence: true
  validates :end_at, presence: true
  validates_with TaskValidator 

  enum status: { todo: 0, doing: 1, done: 2 }
  enum priority: { low: 0, mid: 1, high: 2 }
end
