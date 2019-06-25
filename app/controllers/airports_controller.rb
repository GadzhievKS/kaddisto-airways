class AirportsController < ApplicationController
  # GET /airports
  # GET /airports.json
  def index
    @airports = Airport.all
  end

  # POST /airports
  # POST /airports.json
  def create
    @airport = Airport.new(airport_params)

    respond_to do |format|
      if @airport.save
        format.html { redirect_to airports_path, notice: 'Аэропорт добавлен.' }
        format.json { render :index, status: :created, location: airports_path }
      else
        format.html { render :new }
        format.json { render json: @airport.errors, status: :unprocessable_entity }
      end
    end
  end

  # GET /airports/new
  def new
    @airport = Airport.new
  end

  private
  def airport_params
    params.fetch(:airport, {}).permit(:name, :city)
  end
end
