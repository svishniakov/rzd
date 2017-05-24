class TicketsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_ticket, only: %i[show edit destroy]


  def index
    @tickets = current_user.tickets.all
  end

  def show
  end

  def new
    @ticket = current_user.tickets.new
  end

  def edit
  end

  def create
    @ticket = current_user.tickets.new(ticket_params)
    if @ticket.save
      redirect_to @ticket, notice: 'Ticket was successfully created.'
    else
      render :new
    end
  end

  def destroy
    @ticket.destroy
    redirect_to tickets_url, notice: 'Ticket was successfully destroyed.'
  end

  private

  def set_ticket
    @ticket = Ticket.find(params[:id])
  end

  def ticket_params
    params.require(:ticket).permit(:user_id, :number, :passenger, :passport, :train_id, :start_station_id, :end_station_id)
  end

end
