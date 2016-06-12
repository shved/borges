class Game < ApplicationRecord
  has_many :game_sessions

  validates :game_type, inclusion: { in: %w(start_with_letter avoid_letter wrap_word) }

  translates :name, :desc

  TYPES = [:start_with_letter, :avoid_letter, :wrap_word].freeze

  ALPHABET = {
    :ru => ['а', 'б', 'в', 'г', 'д', 'е', 'ж', 'з', 'и', 'к', 'л', 'м', 'н', 'о', 'п', 'р', 'с', 'т', 'у', 'ф', 'х', 'ц', 'ч', 'ш', 'щ', 'ы', 'э', 'ю', 'я'].to_set,
    :en => ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z'].to_set
  }
end
