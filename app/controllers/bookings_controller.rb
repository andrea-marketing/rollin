class BookingsController < ApplicationController
  before_action :set_booking, only: [:destroy, :show]
  before_action :set_vehicle, only: [:new, :create]

  def index
    @bookings = Booking.where(user_id: current_user.id)
  end

  def show
    @booking = @booking.vehicle
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.vehicle = @vehicle
    @booking.user = current_user
    if @booking.start_date && @booking.end_date
      @booking.value = (@booking.start_date - @booking.end_date).to_f * @booking.vehicle.price.to_f
    else
      @booking.price = 0
    end
    if @booking.save
      redirect_to booking_path(@booking)
    else
      redirect_to vehicle_path(@vehicle)
    end
  end

  def destroy
    @booking.destroy
    redirect_to root_path
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :price, :user_id, :vehicle_id)
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end
end
