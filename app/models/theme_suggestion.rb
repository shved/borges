class ThemeSuggestion < ApplicationRecord
  Game::TYPES.each do |type|
    scope type.to_sym, -> { where("game_types ? '#{type}'") }
  end

  translates :text

  def to_json
    {
      'id': self.id,
      'text': self.text
    }.to_json
  end
end
