class Like < ApplicationRecord
  belongs_to :game_session
  belongs_to :author
end
