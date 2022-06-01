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
    # @order = Order.new
    # authorize @order

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

    if @offer.save
      redirect_to offer_path(@offer), notice: 'Your offer was successfully created! '
    else
      render :new
    end
  end

  def edit
    @offer = Offer.find(params[:id])
    authorize @offer
  end

  def update
    @offer = Offer.find(params[:id])
    authorize @offer
    @offer.update(offer_params)
  end

  def destroy
    @offer = Offers.find(params[:id])
    authorize @offer
    @offer.destroy

    redirect_to offers_path
  end

  def destroy_all
    @offers = Offer.all
    @offers.each do |offer|
      offer.orders.each do |order|
        authorize order
        order.destroy
      end
      authorize offer
      offer.comments.each do |comment|
        comment.destroy
      end
      offer.destroy
    end

    redirect_to offers_path
  end

  private

  def offer_params
    params.require(:offer).permit(
      :supplier_offer_url, :supplier_id, :category, :deadline, :photo,
      :name, :description, :initial_price, :target_price,:target_amount, :target_amount)
  end

   def order_params
     params.require(:order).permit(:amount)
   end
end
