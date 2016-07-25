class Author < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :game_sessions

  validates :login, uniqueness: true
  validates :email, uniqueness: true

  def login
    read_attribute(:login).prepend('@')
  end
end
