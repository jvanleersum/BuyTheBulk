class OffersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  def index
    @offers = policy_scope(Offer).order(deadline: :desc)
  end

  def show
    @offer = Offer.find(params[:id])
    authorize @offer
  end

  def new
    @offer = Offer.new
    authorize @offer
  end

  def create
    @offer = Offer.new(offer_params)
    authorize @offer
    @user = current_user
    @offer.user = @user
    if @offer.save!
      redirect_to offer_path(@offer), notice: 'Offer was successfully created! Yay!'
    else
      render 'offers/new'
    end
  end

  private

  def offer_params
    params.require(:offer).permit(
      :name, :description, :initial_price, :target_price, :target_amount,
      :supplier_offer_url,:supplier_id, :category, :deadline)
  end
end
