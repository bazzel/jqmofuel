class ChartsController < ApplicationController

  def show
    @car = current_user.cars.find(params[:car_id])
    render params[:id]
  end

end
