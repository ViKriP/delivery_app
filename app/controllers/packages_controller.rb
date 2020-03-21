class PackagesController < ApplicationController
  def create
    courier = Courier.find_by(id: params[:courier_id])

    package = courier.packages.create(package_params)

    if package.save
      redirect_to courier, notice: t('package_cr',
                                     tracking_number: package.tracking_number,
                                     courier: courier.name)
    else
      redirect_to courier, alert: t('package_cr_err')
    end
  end

  private

  def package_params
    params.require(:package).permit(:tracking_number, :delivery_status)
  end
end
