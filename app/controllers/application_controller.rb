class ApplicationController < ActionController::Base

  def index
    @tickets = Ticket.all
  end
end
