class OffersController < ApplicationController


  def show
    @offer = Offer.find(params[:id])
    authorize @offer
  end
end
