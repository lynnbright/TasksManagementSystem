class TaskValidator < ActiveModel::Validator
  def validate(record)
    datetime_validate(record)
  end

  private
  def datetime_validate(record)
    start_at = record.start_at
    end_at = record.end_at

    if start_at && end_at
      start_at > end_at ? record.errors[:end_at] << "不能早於開始時間" : true
    end
  end
end