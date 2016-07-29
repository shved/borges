class GameSession < ApplicationRecord
  belongs_to :game
  belongs_to :author

  validates :text, presence: true

  serialize :props

  def text
    clean_text read_attribute(:text)
  end

  private

  def clean_text(raw_text)
    raw_text.to_s
  end
end
