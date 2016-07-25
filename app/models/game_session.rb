class GameSession < ApplicationRecord
  belongs_to :game
  belongs_to :author

  validates :text, presence: true

  def props
    JSON.parse(read_attribute(:props)).with_indifferent_access
  end

  def text
    clean_text read_attribute(:text)
  end

  private

  def clean_text(raw_text)
    raw_text.to_s
  end
end
