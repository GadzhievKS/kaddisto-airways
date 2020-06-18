class AircraftsController < ApplicationController
  before_action :authenticate_user!, only: %i(new edit create edit destroy)
  before_action :set_aircraft, only: [:show, :edit, :update, :destroy]
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

  def update
    if @aircraft.update_attributes(aircraft_params)
      redirect_to aircrafts_path, success: 'Самолет успешно обновлен'
    else
      render :edit, danger: 'Самолет не обновлен'
    end
  end

  def edit

  end

  def destroy
    @aircraft.destroy
    redirect_to aircrafts_path, success: 'Самолет успешно удален'
  end

  private

  def set_aircraft
    @aircraft = Aircraft.find(params[:id])
  end


  private
  def aircraft_params
    params.fetch(:aircraft, {}).permit(:name, :seat_counts, :airline_id)
  end
end
