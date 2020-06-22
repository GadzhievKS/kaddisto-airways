class Ticket < ApplicationRecord
  belongs_to :flight
  belongs_to :user

  def departure_time
    flight.time.in_time_zone(Time.zone.name).strftime('%H:%M, %d.%m.%Y')
  end
end
