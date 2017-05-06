class RailwayStationTitleChangeToName < ActiveRecord::Migration[5.0]
  def change
    remove_column :railway_stations, :title
    add_column :railway_stations, :name, :string
  end
end
