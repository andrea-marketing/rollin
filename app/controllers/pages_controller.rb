class PagesController < ApplicationController
  def home
  end

  def dashboard
    @user = current_user
    @vehicles = Vehicle.where(user: current_user)
    @booking_request = @user.bookings
    @booking_demands = []
    @bookings = Booking.all
    @bookings.each do |booking|
      @booking_demands << booking if booking.vehicle.user == @user
    end
  end
end
