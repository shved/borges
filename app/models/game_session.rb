class GameSession < ApplicationRecord
  belongs_to :game
  belongs_to :author

  validates :text, presence: true
  validates :text, length: { maximum: 50_000 }

  Game::TYPES.each do |type|
    scope type, -> { joins(:game).where('games.game_type = ?', type) }
  end
end
