class BookingsController < ApplicationController
  before_action :set_booking, only: [:destroy, :show, :accept, :reject]

  def index
    # @user = current_user
    # @bookings = @user.bookings
    @bookings = Booking.all
  end

  def show
    @vehicle = Vehicle.find(params[:vehicle_id])
    @vehicle = @booking.vehicle
    authorize @booking
  end

  def new
    @vehicle = Vehicle.find(params[:vehicle_id])
    @booking = Booking.new
    authorize @booking
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @vehicle = Vehicle.find(params[:vehicle_id])
    @booking.vehicle = @vehicle
    if @booking.start_date && @booking.end_date
      @booking.price = (@booking.end_date - @booking.start_date).to_f * @booking.vehicle.price.to_f
    else
      @booking.price = 0
    end
    if @booking.save
      redirect_to vehicle_booking_path(@vehicle, @booking)
    else
      redirect_to vehicle_path(@vehicle)
    end
    authorize @booking
  end

  def accept
    @booking.status = 1
    authorize @booking

    if @booking.save
      sleep(2)
      redirect_to root_path
    else
      render :new
    end
  end

  def reject
    @booking.status = 2
    @booking.save
    authorize @booking
  end

  def destroy
    @booking.destroy
    redirect_to root_path
    authorize @booking
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :price, :user_id, :vehicle_id)
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end
end
