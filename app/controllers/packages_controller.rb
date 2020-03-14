class PackagesController < ApplicationController
  def create
    @courier = Courier.find_by(id: params[:courier_id])

    @package = @courier.packages.create(package_params)

    @package.save

    redirect_to @courier
  end
  
  private

  def package_params
    params.require(:package).permit(:tracking_number, :delivery_status)
  end
end
