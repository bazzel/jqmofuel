class CarsController < ApplicationController
  before_filter :find_car, :only => [:show, :edit, :update, :destroy]

  # GET /cars
  def index
    @cars = current_user.cars
  end

  # GET /cars/new
  def new
    @car = current_user.cars.new_default
    @fuels = Fuel.all
  end

  def create
    @car = current_user.cars.build(params[:car])

    if @car.save
      redirect_to new_refueling_path
    else
      render "new"
    end
  end

  # GET /cars/1
  def show
  end

  # GET /cars/1/edit
  def edit
    @fuels = Fuel.all
  end

  # PUT /cars/1
  def update
    if @car.update_attributes(params[:car])
      redirect_to @car
    else
      render "edit"
    end
  end

  # DELETE /cars/1
  def destroy
    @car.destroy

    redirect_to cars_path
  end

  private
    def find_car
      @car = current_user.cars.find(params[:id])
    end
end
