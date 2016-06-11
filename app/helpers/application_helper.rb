module ApplicationHelper
  def current_translations
    @translations ||= I18n.backend.send(:translations)
    @translations[I18n.locale].with_indifferent_access
  end

  def session_result_font_size(text_length)
    case text_length
    when (0..24) then '48px'
    when (0..49) then '36px'
    when (50..99) then '28px'
    when (100..199) then '22px'
    when (200..299) then '18px'
    when (300..499) then '16px'
    when (500..999) then '14px'
    when (1000..1499) then '12px'
    else
      '10px'
    end
  end
end
