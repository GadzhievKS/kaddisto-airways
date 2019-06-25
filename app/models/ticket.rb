class Ticket < ApplicationRecord
  belongs_to :aircraft
  belongs_to :airport

  validates :from, :to, :time, :price, presence: true

  def departure_time
    time.in_time_zone(Time.zone.name).strftime('%H:%M, %d.%m.%Y')
  end
end
