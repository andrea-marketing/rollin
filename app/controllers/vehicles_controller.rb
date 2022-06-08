class VehiclesController < ApplicationController
  before_action :set_vehicle, only: %i[show edit update destroy]
  def index
    @vehicles = policy_scope(Vehicle).order(created_at: :desc)

    @markers = @vehicles.geocoded.map do |vehicle|
      {
        lat: vehicle.latitude,
        lng: vehicle.longitude,
        info_window: render_to_string(partial: "info_window", locals: { vehicle: vehicle })
      }
    end
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
    @booking = Booking.new
    authorize @booking
  end

  def destroy
    authorize @vehicle
    @vehicle.destroy
    redirect_to root_path
  end

  private

  def set_vehicle
    @vehicle = Vehicle.find(params[:id])
  end

  def vehicle_params
    params.require(:vehicle).permit(:vehicle_type, :description, :address, :price, :user, :photo, :name)
  end
end
