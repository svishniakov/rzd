class Ticket < ApplicationRecord
  validates :number, presence: true, uniqueness: true
  validates :train, presence: true
  validates :user, presence: true

  belongs_to :user
  belongs_to :train
end
