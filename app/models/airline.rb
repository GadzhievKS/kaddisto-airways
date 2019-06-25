class Airline < ApplicationRecord
  has_many :aircrafts

  validates :name, :country, presence: true
end
