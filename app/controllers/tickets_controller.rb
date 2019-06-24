class TicketsController < ApplicationController
  # GET /tickets
  # GET /tickets.json
  def index
    @tickets = Ticket.all
  end

  # POST /tickets
  # POST /tickets.json
  def create
    @ticket = Ticket.new(ticket_params)

    respond_to do |format|
      if @ticket.save
        format.html { redirect_to tickets_path, notice: 'Билет добавлен.' }
        format.json { render :index, status: :created, location: tickets_path }
      else
        format.html { render :new }
        format.json { render json: @ticket.errors, status: :unprocessable_entity }
      end
    end
  end

  # GET /tickets/new
  def new
    @ticket = Ticket.new
  end

  private
    def ticket_params
      params.fetch(:ticket, {}).permit(:from, :to, :time, :price, :aircraft_id, :airport_id)
    end
end
