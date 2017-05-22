module Search
  def self.trains(start_station, end_station)
    Train.train_route_station(start_station) & Train.train_route_station(end_station)
  end
end