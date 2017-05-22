class Route < ApplicationRecord
  has_many :railway_stations_routes
  has_many :railway_stations, through: :railway_stations_routes
  has_many :trains

  validates :title, presence: true

  before_validation :set_title

  def start_time
    railway_stations.ordered.first.departure_time_in(self)
  end

  def end_time
    railway_stations.ordered.last.arrival_time_in(self)
  end

  private

  def set_title
    self.title = "#{railway_stations.first.name} - #{railway_stations.last.name}"
  end
end