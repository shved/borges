module ApplicationHelper
  def current_translations
    @translations ||= I18n.backend.send(:translations)
    @translations[I18n.locale].with_indifferent_access
  end

  def game_session_timestamp(created_at)
    # TODO today/1 day ago/ etc
    created_at.to_s
  end
end
