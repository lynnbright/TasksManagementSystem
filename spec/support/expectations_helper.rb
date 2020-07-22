module ExpectationsHelper
  def expect_task_attributes_eq(task, values = {})
    values.each do |k, v|
      task_value = task.try(k.to_sym)
      expect(task_value).to eq(v)
    end
  end

  def expect_task_contents_eq(task, values = {})
    values.each do |k, v|
      view_task_contents = task.try(k.to_sym)
      expect(view_task_contents).to have_text(v)
    end
  end
end
