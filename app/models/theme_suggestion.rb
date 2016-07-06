class ThemeSuggestion < ApplicationRecord
  Game.pluck('DISTINCT game_type').each do |type|
    scope type.to_sym, -> { where("game_types ? '#{type}'") }
  end

  translates :text
end
