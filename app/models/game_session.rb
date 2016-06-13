class GameSession < ApplicationRecord
  belongs_to :game
  belongs_to :author

  validates :body, presence: true

  def props
    read_attribute(:props).with_indifferent_access
  end
end
