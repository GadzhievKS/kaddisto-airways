class AirlinesController < ApplicationController
  # GET /airlines
  # GET /airlines.json
  def index
    @airlines = Airline.all
  end

  # POST /airlines
  # POST /airlines.json
  def create
    @airline = Airline.new(airline_params)

    respond_to do |format|
      if @airline.save
        format.html { redirect_to airlines_path, notice: 'Авиакомпания добавлена.' }
        format.json { render :index, status: :created, location: airlines_path }
      else
        format.html { render :new }
        format.json { render json: @airline.errors, status: :unprocessable_entity }
      end
    end
  end

  # GET /airlines/new
  def new
    @airline = Airline.new
  end

  private
  def airline_params
    params.fetch(:airline, {}).permit(:name, :country)
  end
end
