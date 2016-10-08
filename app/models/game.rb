class Game < ApplicationRecord
  has_many :game_sessions

  validates :game_type, inclusion: { in: %w(start_with_letter avoid_letter wrap_word) }

  translates :name, :desc

  scope :ordered, -> { order(position: :asc) }

  TYPES = [:start_with_letter, :avoid_letter, :wrap_word].freeze
  TYPES.each do |type|
    define_singleton_method type do
      find_by(game_type: type)
    end
  end

  ALPHABET = {
    :ru => ['а', 'б', 'в', 'г', 'д', 'е', 'ж', 'з', 'и', 'к', 'л', 'м', 'н', 'о', 'п', 'р', 'с', 'т', 'у', 'ф', 'х', 'ц', 'ч', 'ш', 'щ', 'ы', 'э', 'ю', 'я'],
    :en => ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z']
  }

  def self.alphabet
    ALPHABET[I18n.locale]
  end

  def props
    read_attribute(:props).map(&:to_sym)
  end
end
