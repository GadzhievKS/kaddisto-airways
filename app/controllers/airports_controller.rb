class AirportsController < ApplicationController
  before_action :authenticate_user!, only: %i(new edit create edit destroy)
  before_action :set_airport, only: [:show, :edit, :update, :destroy]
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

  def update
    if @airport.update_attributes(airport_params)
      redirect_to airports_path, success: 'Аэропорт успешно обновлен'
    else
      render :edit, danger: 'Аэропорт не обновлен'
    end
  end

  def edit

  end

  def destroy
    @airport.destroy
    redirect_to airports_path, success: 'Статья успешно удалена'
  end

  private

  def set_airport
    @airport = Airport.find(params[:id])
  end

  private
  def airport_params
    params.fetch(:airport, {}).permit(:name, :city)
  end
end
