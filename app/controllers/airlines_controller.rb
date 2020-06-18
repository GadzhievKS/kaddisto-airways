class AirlinesController < ApplicationController
  before_action :authenticate_user!, only: %i(new edit create edit destroy)
  before_action :set_airline, only: [:show, :update, :edit, :destroy]
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

  def update
    if @airline.update_attributes(airline_params)
      redirect_to airlines_path, success: 'Самолет успешно обновлен'
    else
      render :edit, danger: 'Самолет не обновлен'
    end
  end

  def edit

  end

  def destroy
    @airline.destroy
    redirect_to airlines_path, success: 'Авиакомпания успешно удалена'
  end

  private

  def set_airline
    @airline = Airline.find(params[:id])
  end

  private
  def airline_params
    params.fetch(:airline, {}).permit(:name, :country)
  end
end
