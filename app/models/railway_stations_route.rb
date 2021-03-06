class RailwayStationsRoute < ApplicationRecord
  belongs_to :railway_station
  belongs_to :route

  validates :railway_station_id, uniqueness: { scope: :route_id }

  scope :ordered, -> { order(route_id: :asc, position: :asc) }
end