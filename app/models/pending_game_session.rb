class PendingGameSession < ApplicationRecord
  validates :hex, uniqueness: true
end
