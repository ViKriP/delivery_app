class CouriersController < ApplicationController
  def show
    @courier = Courier.find_by(id: params[:id])

    @package = @courier.packages.new
  end

  def new
    @courier = Courier.new
  end

  def edit
    @courier = Courier.find_by(id: params[:id])
  end

  def create
    @courier = Courier.new(courier_params)
 
    @courier.save

    redirect_to @courier
  end

  def update
    @courier = Courier.find_by(id: params[:id])

    @courier.update(courier_params)

    redirect_to @courier
  end

  private

  def courier_params
    params.require(:courier).permit(:name, :email)
  end
end
