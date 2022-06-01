class OrdersController < ApplicationController
  def index
    @orders = policy_scope(Order)
    @orders = Order.all()
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
