class RailwayStation < ApplicationRecord
  has_many :trains
  has_many :railway_stations_routes
  has_many :routes, through: :railway_stations_routes
  has_many :start_stations, class_name: 'Ticket', foreign_key: :start_station_id
  has_many :end_stations, class_name: 'Ticket', foreign_key: :end_station_id

  validates :name, presence: true, uniqueness: true

  # scope :ordered, -> { joins(:railway_stations_routes).order('railway_stations_routes.position').distinct }
  scope :ordered, -> { select('railway_stations.*, railway_stations_routes.position').joins(:railway_stations_routes).order("railway_stations_routes.position").uniq }

  def update_position(route, position)
    station_route = station_route(route)
    station_route.update(position: position) if route
  end

  def update_time(route, arrival_time, departure_time)
    station_route = station_route(route)
    station_route.update(arrival_time: arrival_time, departure_time: departure_time) if route
  end

  def position_in(route)
    station_route(route).try(:position)
  end

  def arrival_time_in(route)
    arrival_time = station_route(route).try(:arrival_time)
    arrival_time.strftime('%H:%M') unless arrival_time.nil?
  end

  def departure_time_in(route)
    departure_time = station_route(route).try(:departure_time)
    departure_time.strftime('%H:%M') unless departure_time.nil?
  end

  private

  def attach_to_route(route)
    if position_check(route).nil?
      last_position = route.railway_stations_routes.maximum(:position)
      last_position += 1
      route.railway_stations_routes.create(railway_station: self, position: last_position)
    end
  end

  def station_route(route)
    @station_route ||= railway_stations_routes.where(route: route).first
  end
end
