class GameSession < ApplicationRecord
  belongs_to :game
  belongs_to :author

  validates :body, presence: true
end
