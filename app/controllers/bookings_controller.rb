class BookingsController < ApplicationController
  before_action :set_booking, only: [:destroy, :show]

  def index
    @user = current_user
    @bookings = @user.bookings
    @bookings = Booking.all
  end

  def show
    @vehicle = Vehicle.find(params[:vehicle_id])
  end

  def new
    @vehicle = Vehicle.find(params[:vehicle_id])
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    booking.user = current_user
    @vehicle = Vehicle.find(params[:vehicle_id])
    @booking.vehicle = @vehicle
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
