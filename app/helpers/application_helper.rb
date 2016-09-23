module ApplicationHelper
  def current_translations
    @translations ||= I18n.backend.send(:translations)
    @translations[I18n.locale].with_indifferent_access
  end

  def game_session_timestamp(created_at)
    case I18n.locale
    when 'ru' then Russian::strftime(created_at, "%d %B '%y")
    when 'en' then created_at.strftime("%d %b '%y")
    end
  end

  def session_specific_option(game_session)
    case game_session.game.game_type
    when 'start_with_letter', 'avoid_letter' then game_session.props['letter']
    else
      nil
    end
  end
end
