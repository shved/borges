class GameSession < ApplicationRecord
  belongs_to :game
  belongs_to :author

  validates :text, presence: true
  validates :text, length: { maximum: 50_000 }

  serialize :props
end
