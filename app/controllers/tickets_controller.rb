class TicketsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_ticket, only: [:show, :edit, :update, :destroy]
  before_action :set_flight, only: %i[create]

  # GET /tickets
  # GET /tickets.json
  def index
    @tickets = current_user.tickets
  end

  # POST /tickets
  # POST /tickets.json
  def create
    @ticket = Ticket.new(user: current_user, flight: @flight)
    @ticket.price = @flight.price
    if @ticket.save
      @flight.to_full!  if @flight.tickets.count >= @flight.aircraft.seat_counts.to_i
      redirect_to flights_path, notice: 'Вы успешно забронировали место!'
    else
      redirect_to flights_path, error: 'Произошла ошибка, пожалуйста попробуйте еще раз!'
    end
  end


  # GET /tickets/new
  def new
    @ticket = Ticket.new
  end

  def update
    if @ticket.update_attributes(ticket_params)
      redirect_to tickets_path, success: 'Билет успешно обновлен'
    else
      render :edit, danger: 'Билет не обновлен'
    end
  end

  def edit

  end

  def destroy
    @ticket.destroy
    redirect_to tickets_path, success: 'Билет успешно удален'
  end

  private

  def set_flight
    @flight = Flight.find(params[:flight_id])
  end

  def set_ticket
    @ticket = Ticket.find(params[:id])
  end
end
