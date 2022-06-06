class BusinessesController < ApplicationController
  skip_before_action :verify_business
  skip_after_action :verify_authorized

  def new
    @business = Business.new()
  end

  def create

    @business = Business.new(business_params)
    @business.user = current_user
    if @business.save
      redirect_to offers_path, notice: 'Your business was successfully created! '
    else
      render :new
    end
  end

  private
  def business_params
    params.require(:business).permit(:photo, :name, :description, :nickname, :address)
  end

end
