class Train < ApplicationRecord
  belongs_to :current_station, class_name: 'RailwayStation', foreign_key: :current_station_id, required: false
  belongs_to :route, required: false
  has_many :tickets

  validates :number, presence: true, uniqueness: true
end
