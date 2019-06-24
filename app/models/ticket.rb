class Ticket < ApplicationRecord
  belongs_to :aircraft
  belongs_to :airport

  validates :from, :to, :time, :price, presence: true
end
