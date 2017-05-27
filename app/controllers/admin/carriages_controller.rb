class Admin::CarriagesController < Admin::BaseController
  before_action :set_carriage, only: %i[show edit update destroy]
  before_action :set_train, only: %i[index new create]

  def index
    @carriages = @train.carriages.all
  end

  def show
    @carriage = Carriage.find(params[:id])
  end

  def new
    @carriage = Carriage.new
  end

  def edit
  end

  def create
    @carriage = @train.carriages.new(carriage_params)
    if @carriage.save
      redirect_to admin_train_path(@train), notice: I18n.t('controllers.created', resource_name: @carriage.model_name.human)
    else
      render :new
    end
  end

  def update
    if @carriage.update(carriage_params)
      redirect_to admin_carriage_path(@carriage ), notice: I18n.t('controllers.updated', resource_name: @carriage.model_name.human)
    else
      render :edit
    end
  end

  def destroy
    @carriage.destroy
    redirect_to admin_carriages_url, notice: I18n.t('controllers.destroyed', resource_name: @carriage.model_name.human)
  end

  private

  def set_train
    @train = Train.find(params[:train_id])
  end

  def set_carriage
    @carriage = Carriage.find(params[:id])
  end

  def carriage_params
    params.require(:carriage).permit(:number, :train_id, :type, :top_seats, :bottom_seats,\
                                     :side_top_seats, :side_bottom_seats, :sitting_seats)
  end
end
