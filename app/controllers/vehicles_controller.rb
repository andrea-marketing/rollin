class VehiclesController < ApplicationController
  before_action :set_vehicle, only: [:show, :edit, :update]
  def index
    @vehicles = policy_scope(Vehicle).order(created_at: :desc)
  end

  def new
    @vehicle = Vehicle.new
    authorize @vehicle
  end

  def create
    @vehicle = Vehicle.new(vehicle_params)
    @vehicle.user = current_user
    if @vehicle.save
      redirect_to vehicle_path(@vehicle)
    else
      render :new
    end
    authorize @vehicle
  end

  def edit
    authorize @vehicle
  end

  def update
    @vehicle.update(vehicle_params)
    redirect_to vehicle_path
    authorize @vehicle
  end

  def show
    authorize @vehicle
  end

  private

  def set_vehicle
    @vehicle = Vehicle.find(params[:id])
  end

  def vehicle_params
    params.require(:vehicle).permit(:vehicle_type, :description, :address, :price, :user_id, :photo, :name)
  end
end
