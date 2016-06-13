class Author < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def login
    read_attribute(:login).prepend('@')
  end
end
