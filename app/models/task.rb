class Task < ApplicationRecord
  validates :title, presence: true
  validates :priority, presence: true
  validates :status, presence: true
end
