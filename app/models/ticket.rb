class Ticket < ApplicationRecord
  validates :price, :time, :place_departure, :place_arrival, presence: true

end
