class BusinessesController < ApplicationController
  skip_before_action :verify_business
  skip_after_action :verify_authorized

  def show
    @business = Business.find(params[:id])
    if @business.geocoded?
      @marker = {
        lat: @business.latitude,
        lng: @business.longitude
      }
    end
  end

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

  def edit
    @business = Business.find(current_user.business.id)
  end

  def update
    @business = Business.find(current_user.business.id)
    if @business.update(business_params)
      redirect_to business_path, notice: 'Your business was successfully updated'
    else
      render :new
    end
  end

  private
  def business_params
    params.require(:business).permit(:photo, :name, :description, :nickname, :address)
  end

end
