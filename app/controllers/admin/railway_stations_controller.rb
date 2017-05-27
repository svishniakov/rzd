class Admin::RailwayStationsController < Admin::BaseController
  before_action :set_railway_station, except: %i[index new create]
  before_action :set_route, only: %i[update_position update_time]

  def index
    @railway_stations = RailwayStation.all
  end

  def show
  end

  def new
    @railway_station = RailwayStation.new
  end

  def edit
  end

  def create
    @railway_station = RailwayStation.new(railway_station_params)

    if @railway_station.save
      redirect_to admin_railway_station_path(@railway_station), notice: I18n.t('controllers.created', resource_name: @railway_station.model_name.human)
    else
      render :new
    end
  end

  def update
    if @railway_station.update(railway_station_params)
      redirect_to admin_railway_stations_path, notice: I18n.t('controllers.updated', resource_name: @railway_station.model_name.human)
    else
      render :edit
    end
  end

  def update_position
    @railway_station.update_position(@route, params[:position])
    redirect_to admin_route_path(@route)
  end

  def update_time
    @railway_station.update_time(@route, params[:arrival_time], params[:departure_time])
    redirect_to admin_route_path(@route)
  end

  def destroy
    @railway_station.destroy
    redirect_to admin_railway_stations_url, notice: I18n.t('controllers.destroyed', resource_name: @railway_station.model_name.human)
  end

  private

  def set_route
    @route = Route.find(params[:route_id])
  end

  def set_railway_station
    @railway_station = RailwayStation.find(params[:id])
  end

  def railway_station_params
    params.require(:railway_station).permit(:name)
  end
end
