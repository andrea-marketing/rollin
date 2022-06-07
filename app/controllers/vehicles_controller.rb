class VehiclesController < ApplicationController
  def index
    @vehicles = Vehicle.all
  end

  def new
    @vehicle = Vehicle.new
  end

  def create
    @vehicle = Vehicle.new(vehicle_params)
    if @vehicle.save
      redirect_to vehicle_path(@vehicle)
    else
      render :new
    end
  end

  def show
    @vehicle = Vehicle.find(params[:user_id])
  end

  private

  def vehicle_params
    params.require(:vehicles).permit(:vehicle_type, :description, :address, :price, :user_id)
  end
end
