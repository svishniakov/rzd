class Train < ApplicationRecord
  belongs_to :current_station, class_name: 'RailwayStation', foreign_key: :current_station_id, required: false
  belongs_to :route, required: false
  has_many :tickets
  has_many :carriages

  validates :number, presence: true, uniqueness: true

  def seats_info(carriage_type, seats)
    carriages.where(type: carriage_type).sum(seats)
  end
end
