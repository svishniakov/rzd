class Ticket < ApplicationRecord
  belongs_to :user, required: false
  belongs_to :train
  belongs_to :start_station, class_name: 'RailwayStation', foreign_key: :start_station_id
  belongs_to :end_station, class_name: 'RailwayStation', foreign_key: :end_station_id

  validates :number, presence: true, uniqueness: true
  validates :passenger, presence: true

  before_validation :set_number

  private

  def set_number
    self.number ||= 10.times.map { [*'0'..'9', *'A'..'Z'].sample }.join
  end
end
