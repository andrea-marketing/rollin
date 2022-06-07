class VehiclesController < ApplicationController
  def index
    @vehicles = Vehicle.all
  end

  def new
    @vehicle = Vehicle.new
  end

  def create
    @vehicle = Vehicle.new(vehicle_params)
    @vehicle.user = current_user
    if @vehicle.save
      redirect_to vehicle_path(@vehicle)
    else
      render :new
    end
  end

  def show
    @vehicle = Vehicle.find(params[:id])
  end

  private

  def vehicle_params
    params.require(:vehicle).permit(:vehicle_type, :description, :address, :price, :user_id, :name)
  end
end
