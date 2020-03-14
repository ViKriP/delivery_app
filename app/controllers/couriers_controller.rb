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
 
    if @courier.save
      redirect_to @courier, notice: t('courier_cr')
    else
      redirect_to @courier, alert: t('courier_cr_err')
    end
  end

  def update
    @courier = Courier.find_by(id: params[:id])

    if @courier.update(courier_params)
      redirect_to @courier, notice: t('courier_upd')
    else
      redirect_to @courier, alert: t('courier_upd_err')
    end
  end

  private

  def courier_params
    params.require(:courier).permit(:name, :email)
  end
end
