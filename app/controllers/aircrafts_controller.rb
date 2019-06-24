class AircraftsController < ApplicationController
  # GET /aircrafts
  # GET /aircrafts.json
  def index
    @aircrafts = Aircraft.includes(:airline)
  end

  # POST /aircrafts
  # POST /aircrafts.json
  def create
    @aircraft = Aircraft.new(aircraft_params)

    respond_to do |format|
      if @aircraft.save
        format.html { redirect_to aircrafts_path, notice: 'Самолет добавлен.' }
        format.json { render :index, status: :created, location: aircrafts_path }
      else
        format.html { render :new }
        format.json { render json: @aircraft.errors, status: :unprocessable_entity }
      end
    end
  end

  # GET /aircrafts/new
  def new
    @aircraft = Aircraft.new
  end

  private
  def aircraft_params
    params.fetch(:aircraft, {}).permit(:name, :seat_counts, :airline_id)
  end
end
