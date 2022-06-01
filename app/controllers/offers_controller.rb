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
    @order = Order.new
    authorize @order

  end

  def create
    @offer = Offer.new(offer_params)
    @order = Order.new(order_params)
    authorize @offer
    authorize @order
    @user = current_user
    @offer.user = @user
    @order.offer = @offer
    @order.user = current_user

    if @offer.save && @order.save
      redirect_to offer_path(@offer), notice: 'Your offer was successfully created! '
    else
      render :new
    end
  end

  private

  def offer_params
    params.require(:offer).permit(
      :supplier_offer_url, :supplier_id, :category, :deadline, :photo,
      :name, :description, :initial_price, :target_price, :target_amount, orders_attributes: [:amount])
  end

  def order_params
    params.require(:order).permit(:amount)
  end
end
