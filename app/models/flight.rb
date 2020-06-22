class Flight < ApplicationRecord
  include AASM

  belongs_to :aircraft
  has_many :tickets

  validates :from, :to, :time, :price, presence: true

  aasm column: :state, skip_validation_on_save: true, no_direct_assignment: false do
    state :pending, initial: true
    state :full
    state :canceled
    state :complete

    event :to_full do
      transitions from: :pending, to: :full
    end

    event :to_canceled do
      transitions from: :pending, to: :canceled
    end
  end

  def departure_time
    time.in_time_zone(Time.zone.name).strftime('%H:%M, %d.%m.%Y')
  end
end
