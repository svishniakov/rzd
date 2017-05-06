class Ticket < ApplicationRecord
  validates :number, presence: true, uniqueness: true
  # validates :train, presence: true
  # validates :user, presence: true

  belongs_to :user
  belongs_to :train

  def route_start_station
    train.route.railway_stations.name
  end

  def route_finish_station
    train.route.railway_stations.name
  end
end
