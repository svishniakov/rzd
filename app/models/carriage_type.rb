class CarriageType < ApplicationRecord
  has_many :carriages

  validates :name, :seats, presence: true
  validates :name, uniqueness: true
end
