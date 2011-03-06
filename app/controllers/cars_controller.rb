class CarsController < ApplicationController

  # GET /cars
  def index
    @cars = current_user.cars

    if @cars.size == 1
      @car = @cars.first
      logger.debug("[#{self.class}.index] Only 1 car found; redirect to #{car_path(@car)}")
      redirect_to @car
    end
  end

  # GET /cars/new
  def new
    @car = current_user.cars.build
  end

  def create
    @car = current_user.cars.build(params[:car])

    if @car.save
      redirect_to new_refueling_path
    else
      render :action => "new"
    end
  end

  # GET /cars/1
  def show
    @car = current_user.cars.find(params[:id])
  end

  # # GET /cars/1/edit
  # def edit
  #   @car = Car.find(params[:id])
  # end
  #
  # # POST /cars
  # # POST /cars.xml
  # def create
  #   @car = Car.new(params[:car])
  #
  #   respond_to do |format|
  #     if @car.save
  #       format.mobile { redirect_to(cars_url) }
  #       format.html { redirect_to(@car, :notice => 'Car was successfully created.') }
  #       format.xml  { render :xml => @car, :status => :created, :location => @car }
  #     else
  #       format.mobile { render :action => "new" }
  #       format.html { render :action => "new" }
  #       format.xml  { render :xml => @car.errors, :status => :unprocessable_entity }
  #     end
  #   end
  # end
  #
  # # PUT /cars/1
  # # PUT /cars/1.xml
  # def update
  #   @car = Car.find(params[:id])
  #
  #   respond_to do |format|
  #     if @car.update_attributes(params[:car])
  #       format.mobile { redirect_to(@car, :notice => 'Car was successfully updated.') }
  #       format.html { redirect_to(@car, :notice => 'Car was successfully updated.') }
  #       format.xml  { head :ok }
  #     else
  #       format.mobile { render :action => "edit" }
  #       format.html { render :action => "edit" }
  #       format.xml  { render :xml => @car.errors, :status => :unprocessable_entity }
  #     end
  #   end
  # end
  #
  # # DELETE /cars/1
  # # DELETE /cars/1.xml
  # def destroy
  #   @car = Car.find(params[:id])
  #   @car.destroy
  #
  #   respond_to do |format|
  #     format.mobile { redirect_to(cars_url) }
  #     format.html { redirect_to(cars_url) }
  #     format.xml  { head :ok }
  #   end
  # end
end
