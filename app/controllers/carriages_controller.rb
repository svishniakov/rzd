class CarriagesController < ApplicationController
  before_action :set_carriage, only: [:show, :edit, :update, :destroy]

  # GET /carriages
  # GET /carriages.json
  def index
    @carriages = Carriage.all
  end

  # GET /carriages/1
  # GET /carriages/1.json
  def show
  end

  # GET /carriages/new
  def new
    @carriage = Carriage.new
  end

  # GET /carriages/1/edit
  def edit
  end

  # POST /carriages
  # POST /carriages.json
  def create
    @carriage = Carriage.new(carriage_params)

    respond_to do |format|
      if @carriage.save
        format.html { redirect_to @carriage, notice: 'Carriage was successfully created.' }
        format.json { render :show, status: :created, location: @carriage }
      else
        format.html { render :new }
        format.json { render json: @carriage.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /carriages/1
  # PATCH/PUT /carriages/1.json
  def update
    respond_to do |format|
      if @carriage.update(carriage_params)
        format.html { redirect_to @carriage, notice: 'Carriage was successfully updated.' }
        format.json { render :show, status: :ok, location: @carriage }
      else
        format.html { render :edit }
        format.json { render json: @carriage.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /carriages/1
  # DELETE /carriages/1.json
  def destroy
    @carriage.destroy
    respond_to do |format|
      format.html { redirect_to carriages_url, notice: 'Carriage was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_carriage
      @carriage = Carriage.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def carriage_params
      params.require(:carriage).permit(:number)
    end
end
