class Ticket < ApplicationRecord
  validates :number, presence: true, uniqueness: true
end
