class TicketsController < ApplicationController
  before_action :authenticate_user!

  def index
    @tickets = current_user.tickets
  end

  def show
    @ticket = current_user.tickets.find(params[:id])
  end

  private

  def set_ticket
    @ticket = Ticket.find(params[:id])
  end

  def ticket_params
    params.fetch(:ticket, {}).permit(:from, :to, :time, :price, :aircraft_id, :airport_id)
  end
end
