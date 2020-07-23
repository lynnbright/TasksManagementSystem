class Task < ApplicationRecord
  validates :title, presence: true
  validates :priority, presence: true
  validates :status, presence: true

  enum status: { I18n.t("status.ToDo") => 0, I18n.t("status.Doing") => 1, I18n.t("status.Done") => 2 }
  enum priority: { I18n.t("priority.low") => 0, I18n.t("priority.mid")=> 1, I18n.t("priority.high") => 2 }

  def self.status_options
    self.statuses.keys
  end

  def self.priority_options
    self.priorities.keys
  end
end
