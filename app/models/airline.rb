class Airline < ApplicationRecord
  has_many :aircrafts

  validates :name, presence: true
end
