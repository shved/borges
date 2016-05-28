class Game < ApplicationRecord
  has_many :game_results

  TYPES = [:starts_with_letter, :with_no_letter, :wrap_the_word].freeze
end
