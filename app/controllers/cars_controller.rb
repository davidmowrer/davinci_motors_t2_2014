class CarsController < ApplicationController

  def index
    @cars = Car.all
  end

  def new
    @car = Car.new
  end

  def create
    @car = Car.new(car_params)
    creation_message = "#{@car.year} #{@car.make} #{@car.model} created"
    if @car.save
      redirect_to cars_path,
                  notice: creation_message
    end
  end

  def show
    @car = Car.find(params[:id])
  end

  def edit
    @car = Car.find(params[:id])
  end

  def update
    @car = Car.find(params[:id])
    respond_to do |format|
      if @car.update(car_params)
        format.html { redirect_to cars_path, notice: 'Car was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def show
    @car = Car.find(params[:id])
  end

  def destroy
    @car = Car.find(params[:id])
    @car.destroy
    respond_to do |format|
      format.html { redirect_to cars_path, notice: 'Car was successfully deleated.' }
    end
  end

  private

  def car_params
    params.require(:car).permit(:make, :model, :year, :price)
  end
end
