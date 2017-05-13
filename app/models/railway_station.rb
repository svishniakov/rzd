class RailwayStation < ApplicationRecord
  has_many :trains
  has_many :railway_stations_routes
  has_many :routes, through: :railway_stations_routes
  has_many :start_stations, class_name: 'Ticket', foreign_key: :start_station_id
  has_many :end_stations, class_name: 'Ticket', foreign_key: :end_station_id

  validates :name, presence: true, uniqueness: true

  def position_check(route)
    station_route(route).try(:position)
  end

  def position_update(route, position)
    station_route = station_route(route)
    station_route.update(position: position) if station_route
  end

  protected

  def station_route(route)
    @station_route ||= railway_stations_routes.where(route: route).first
  end
end
