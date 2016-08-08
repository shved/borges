class Author < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # after_create :save_game_session

  has_many :game_sessions

  validates :login, uniqueness: true
  validates :email, uniqueness: true

  attr_accessor :pending_game_session_hex

  def login
    read_attribute(:login).prepend('@') if read_attribute(:login).present?
  end

  # private
  #
  # def save_game_session
  #   if pending_game_session_hex.present?
  #     pending = PendingGameSession.find_by(hex: pending_game_session_hex)
  #     GameSession.create(
  #       author_id: id,
  #       game_id: pending.game_id,
  #       props: pending.props,
  #       text: peding.text
  #     )
  #     pending.delete
  #   end
  # end
end
