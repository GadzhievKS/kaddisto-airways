class Airport < ApplicationRecord
  has_many :aircrafts

  validates :name, :city, presence: true
end
