class Ticket < ApplicationRecord
  belongs_to :user
  belongs_to :train
  belongs_to :start_station, class_name: 'RailwayStation', foreign_key: :start_station_id
  belongs_to :end_station, class_name: 'RailwayStation', foreign_key: :end_station_id

  validates :number, presence: true, uniqueness: true
  validates :passenger, presence: true

  before_validation :set_number
  after_create :buy_notification
  after_destroy :cancel_notification

  def route_name
    "#{start_station.name} - #{end_station.name}"
  end

  private

  def buy_notification
    TicketsMailer.buy_ticket(self.user, self).deliver_now
  end

  def cancel_notification
    TicketsMailer.cancel_ticket(self.user, self).deliver_now
  end

  def set_number
    self.number ||= [*'0'..'9', *'A'..'Z'].sample(10).join
  end
end
