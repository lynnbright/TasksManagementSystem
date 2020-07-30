class Task < ApplicationRecord
  validates :title, presence: true
  validates :priority, presence: true
  validates :status, presence: true

  enum status: { todo: 0, doing: 1, done: 2 }
  enum priority: { low: 0, mid: 1, high: 2 }
end
