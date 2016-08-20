class Author < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :game_sessions

  validates :name, uniqueness: true
  validates :email, uniqueness: true

  attr_accessor :pending_game_session_hex

  def at_name
    name.prepend('@') if name.present?
  end
end
