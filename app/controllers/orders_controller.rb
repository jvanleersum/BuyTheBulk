class OrdersController < ApplicationController
  def index
    @orders = policy_scope(Order)
    @orders = Order.all()
  end

  def confirmation
  end

  def destroy
    @order = Order.find(params[:id])
    authorize @order
    @order.destroy
  end
end
