class Game < ApplicationRecord
  has_many :game_results

  validates :game_type, inclusion: { in: %w(start_with_letter avoid_letter wrap_word) }

  translates :name, :desc

  TYPES = [:start_with_letter, :avoid_letter, :wrap_word].freeze
end
