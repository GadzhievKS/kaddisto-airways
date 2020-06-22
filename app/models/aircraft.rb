class Aircraft < ApplicationRecord
  belongs_to :airline

  validates :name, :seat_counts, presence: true
end
