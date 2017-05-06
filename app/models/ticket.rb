class Ticket < ApplicationRecord
  validates :number, presence: true, uniqueness: true

  belongs_to :user
end
