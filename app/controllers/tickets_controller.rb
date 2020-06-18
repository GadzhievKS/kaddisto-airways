class TicketsController < ApplicationController
  before_action :authenticate_user!, only: %i(new edit create edit destroy)
  before_action :set_ticket, only: [:show, :edit, :update, :destroy]

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

  def set_ticket
    @ticket = Ticket.find(params[:id])
  end

    def ticket_params
      params.fetch(:ticket, {}).permit(:from, :to, :time, :price, :aircraft_id, :airport_id)
    end
end
