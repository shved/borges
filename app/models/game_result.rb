class GameResult < ApplicationRecord
  belongs_to :game
  belongs_to :author
end
