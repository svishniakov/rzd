class CarriageType < ApplicationRecord
  attr_reader :total_seats
  has_many :carriages

  validates :name, presence: true, uniqueness: true

  def total_seats
    top_seats.to_i + bottom_seats.to_i
  end
end
