class RefuelingsController < ApplicationController
  before_filter :find_refueling, :only => [:show, :edit, :destroy, :update]

  # GET /refuelings
  def index
    @car = current_user.cars.find(params[:car_id])
    @refueling_months = @car.refuelings.grouped_by_month
  end

  # GET /refuelings/new
  def new
    if current_user.cars.empty?
      logger.debug("[#{self.class}.index] No cars found yet, let's create one first.")
      redirect_to new_car_path
    else
      @refueling = current_user.refuelings.build
    end
  end

  # POST /refuelings
  def create
    @refueling = current_user.refuelings.build(params[:refueling])

    if @refueling.save
      redirect_to refueling_path(@refueling, :backbtn => 'false')
    else
      render "new"
    end
  end

  # GET /refuelings/1
  def show
    @cars = current_user.cars
  end

  # GET /refuelings/1/edit
  def edit
  end

  # DELETE /refuelings/1
  def destroy
    @refueling.destroy
    @car = @refueling.car

    redirect_to(@car)
  end

  # PUT /refuelings/1
  def update
    if @refueling.update_attributes(params[:refueling])
      redirect_to @refueling
    else
      render "new"
    end

  end

  private
    def find_refueling
      @refueling = current_user.refuelings.find(params[:id])
    end
end
