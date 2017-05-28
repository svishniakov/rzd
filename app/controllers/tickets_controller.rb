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

  def create
    @ticket = current_user.tickets.new(ticket_params)
    if @ticket.save
      redirect_to @ticket, notice: t('controllers.created', resource_name: @ticket.model_name.human)
    else
      render :new
    end
  end

  def destroy
    @ticket.destroy
    redirect_to tickets_url, notice: t('controllers.destroyed', resource_name: @ticket.model_name.human)
  end

  private

  def set_ticket
    @ticket = Ticket.find(params[:id])
  end

  def ticket_params
    params.require(:ticket).permit(:number, :passenger, :passport, :train_id, :start_station_id, :end_station_id)
  end

end
