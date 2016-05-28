class ResultLike < ApplicationRecord
  belongs_to :game_result
  belongs_to :author
end
