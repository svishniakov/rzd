class Admin::TicketsController < Admin::BaseController
  before_action :set_ticket, only: %i[show edit update destroy]

  def index
    @tickets = Ticket.all
  end

  def show
  end

  def new
    @ticket = Ticket.new
  end

  def edit
  end

  def create
    @ticket = Ticket.new(ticket_params)
    if @ticket.save
      redirect_to admin_ticket_path(@ticket), notice: t('controllers.created', resource_name: @ticket.model_name.human)
    else
      render :new
    end
  end

  def update
    if @ticket.update(ticket_params)
      redirect_to admin_tickets_url, notice: t('controllers.updated', resource_name: @ticket.model_name.human)
    else
      render :edit
    end
  end

  def destroy
    @ticket.destroy
    redirect_to admin_tickets_url, notice: t('controllers.destroyed', resource_name: @ticket.model_name.human)
  end

  private
  def set_ticket
    @ticket = Ticket.find(params[:id])
  end

  def ticket_params
    params.require(:ticket).permit(:user_id, :number, :passenger, :passport, :train_id, :start_station_id, :end_station_id)
  end

end
