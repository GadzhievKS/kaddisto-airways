class Airport < ApplicationRecord
  validates :name, :city, presence: true

  class << self
    def select_options
      all.map{|airport| "#{airport.name} - #{airport.city}"}
    end
  end
end
