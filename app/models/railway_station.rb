class RailwayStation < ApplicationRecord
  has_many :trains
  has_many :railway_stations_routes
  has_many :routes, through: :railway_stations_routes
  has_many :start_stations, class_name: 'Ticket', foreign_key: :start_station_id
  has_many :end_stations, class_name: 'Ticket', foreign_key: :end_station_id

  validates :name, presence: true, uniqueness: true
end
