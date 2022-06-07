class VehiclesController < ApplicationController
  before_action :set_vehicles, only: [:show, :edit]
  def index
    @vehicles = policy_scope(Vehicle)
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

  def edit
  end

  def show
  end

  private

  def set_vehicles
    authorize @vehicle
    @vehicle = Vehicle.find(params[:id])
  end

  def vehicle_params
    params.require(:vehicle).permit(:vehicle_type, :description, :address, :price, :user_id)
  end
end
