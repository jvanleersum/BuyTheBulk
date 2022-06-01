class OrdersController < ApplicationController
  def index
    @orders = policy_scope(Order)
    @orders = Order.all()
  end

  def confirmation
  end


end
