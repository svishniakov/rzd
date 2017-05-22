class Route < ApplicationRecord
  has_many :railway_stations_routes
  has_many :railway_stations, through: :railway_stations_routes
  has_many :trains

  # validates :title, presence: true

  before_save :set_title

  private

  def set_title
    self.title = "#{railway_stations.first.name} - #{railway_stations.last.name}"
  end
end