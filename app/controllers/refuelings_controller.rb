class RefuelingsController < ApplicationController

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
      render :action => "new"
    end
  end

  # GET /refuelings/1
  def show
    @refueling = current_user.refuelings.find(params[:id])
    @cars = current_user.cars
  end

  # GET /refuelings/1/edit
  def edit
    @refueling = current_user.refuelings.find(params[:id])
  end

  # DELETE /refuelings/1
  def destroy
    @refueling = current_user.refuelings.find(params[:id])
    @refueling.destroy
    @car = @refueling.car

    redirect_to(@car)
  end

  # PUT /refuelings/1
  def update
    @refueling = current_user.refuelings.find(params[:id])

    if @refueling.update_attributes(params[:refueling])
      redirect_to @refueling
    else
      render :action => "new"
    end

  end

  # # before_filter :find_car
  #
  # # GET /refuelings
  # # GET /refuelings.xml
  # def index
  #   @refuelings = @car.refuelings.all
  #
  #   respond_to do |format|
  #     format.html # index.html.erb
  #     format.xml  { render :xml => @refuelings }
  #   end
  # end
  #
  # # GET /refuelings/1
  # # GET /refuelings/1.xml
  # def show
  #   @refueling = @car.refuelings.find(params[:id])
  #
  #   respond_to do |format|
  #     format.mobile # show.mobile.haml
  #     format.html # show.html.erb
  #     format.xml  { render :xml => @refueling }
  #   end
  # end
  #
  # # GET /refuelings/new
  # # GET /refuelings/new.xml
  # def new
  #   @refueling = Refueling.new
  #
  #   respond_to do |format|
  #     format.mobile # new.mobile.haml
  #     format.html # new.html.erb
  #     format.xml  { render :xml => @refueling }
  #   end
  # end
  #
  # # GET /refuelings/1/edit
  # def edit
  #   @refueling = @car.refuelings.find(params[:id])
  # end
  #
  # # POST /refuelings
  # # POST /refuelings.xml
  # def create
  #   @refueling = @car.refuelings.build(params[:refueling])
  #
  #   respond_to do |format|
  #     if @refueling.save
  #       format.mobile { redirect_to(@car) }
  #       format.html { redirect_to(@refueling, :notice => 'Refueling was successfully created.') }
  #       format.xml  { render :xml => @refueling, :status => :created, :location => @refueling }
  #     else
  #       format.mobile { render :action => "new" }
  #       format.html { render :action => "new" }
  #       format.xml  { render :xml => @refueling.errors, :status => :unprocessable_entity }
  #     end
  #   end
  # end
  #
  # # PUT /refuelings/1
  # # PUT /refuelings/1.xml
  # def update
  #   @refueling = @car.refuelings.find(params[:id])
  #
  #   respond_to do |format|
  #     if @refueling.update_attributes(params[:refueling])
  #       format.html { redirect_to(@refueling, :notice => 'Refueling was successfully updated.') }
  #       format.xml  { head :ok }
  #     else
  #       format.html { render :action => "edit" }
  #       format.xml  { render :xml => @refueling.errors, :status => :unprocessable_entity }
  #     end
  #   end
  # end
  #
  #
  # # private
  # # def find_car
  # #   @car = Car.find(params[:car_id])
  # # end
end
