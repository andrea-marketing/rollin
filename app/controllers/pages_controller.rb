class PagesController < ApplicationController
  def home
  end

  def dashboard
    @user = current_user
    @vehicles = Vehicle.where(user: current_user)
  end
end
