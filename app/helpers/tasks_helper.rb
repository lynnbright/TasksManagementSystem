module TasksHelper
  def form_select_options(col_name)
    get_options_hash(col_name).keys.map { |key| [ I18n.t("#{col_name}.#{key}"), key] }
  end

  def get_options_hash(col_name)
    Task.try(col_name.pluralize)
  end
end
