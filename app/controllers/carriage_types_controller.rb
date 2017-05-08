class CarriageTypesController < ApplicationController
  before_action :set_carriage_type, only: %i[show edit update destroy]

  def index
    @carriage_types = CarriageType.all
  end

  def show
  end

  def new
    @carriage_type = CarriageType.new
  end

  def edit
  end

  def create
    @carriage_type = CarriageType.new(carriage_type_params)
    if @carriage_type.save
      redirect_to @carriage_type, notice: 'Carriage type was successfully created.'
    else
      render :new
    end
  end

  def update
    if @carriage_type.update(carriage_type_params)
      redirect_to @carriage_type, notice: 'Carriage type was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @carriage_type.destroy
    redirect_to carriage_types_url, notice: 'Carriage type was successfully destroyed.'
  end

  private

  def set_carriage_type
    @carriage_type = CarriageType.find(params[:id])
  end

  def carriage_type_params
    params.require(:carriage_type).permit(:name, :top_seats, :bottom_seats)
  end
end
