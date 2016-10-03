class Like < ApplicationRecord
  belongs_to :game_session
  belongs_to :author

  validates :game_session_id, uniqueness: { scope: :author_id }
end
