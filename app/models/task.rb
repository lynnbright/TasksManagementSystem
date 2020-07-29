class Task < ApplicationRecord
  validates :title, presence: true
  validates :priority, presence: true
  validates :status, presence: true

  enum status: { ToDo: 0, Doing: 1, Done: 2 }
  enum priority: { Low: 0, Mid: 1, High: 2 }
end
