class Aircraft < ApplicationRecord
  has_many :tickets
  belongs_to :airline

  validates :name, :seat_counts, presence: true
end
