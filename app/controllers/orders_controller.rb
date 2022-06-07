class OrdersController < ApplicationController
  skip_before_action :verify_business, except: :create
  def index
    @orders = policy_scope(Order)
    @orders = Order.where(user_id:current_user)
  end

  def show
    @order = Order.find(params[:id])
    authorize @order
  end

  def create
    @offer = Offer.find(params[:offer_id])
    authorize @offer
    @order = Order.new(order_params)
    authorize @offer
    @order.offer = @offer
    @order.user = current_user
    participants = []
    @offer.orders.each do |order|
      participants << order.user
    end
    @participants = participants.uniq
    if @order.save!
      redirect_to order_confirmation_path(@order)
    else
      render "offers/show"
    end
  end

  def order_params
    params.require(:order).permit(:amount)
  end

  def confirmation
    @order = Order.find(params[:order_id])
    authorize @order
  end

  def destroy
    @order = Order.find(params[:id])
    authorize @order
    @order.destroy
  end
end
