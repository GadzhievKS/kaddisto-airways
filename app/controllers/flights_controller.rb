class FlightsController < ApplicationController

  def index
    @flights = Flight.where(state: %i[pending full])
  end
end
