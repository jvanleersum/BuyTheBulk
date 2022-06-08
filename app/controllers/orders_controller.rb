class OrdersController < ApplicationController
  skip_before_action :verify_business, except: :create
  def index
    @orders = policy_scope(Order)
    @orders = Order.joins(:offer).where(user_id:current_user).order("offers.deadline ASC")
    if params[:tab].present?
      @orders = @orders.where("offers.status = '#{params[:tab]}'")
    else
      @orders = @orders.where("offers.status = 'active'")
    end
  end

  def show
    @order = Order.find(params[:id])
    @offer = @order.offer
    @comment = Comment.new
    authorize @order
    @offer = @order.offer
    authorize @offer
    @order.offer = @offer
    participants = []
    @offer.orders.each do |order|
      participants << order.user
    end
    @participants = participants.uniq
  end

  def create
    @offer = Offer.find(params[:offer_id])
    authorize @offer
    @order = Order.new(order_params)
    authorize @offer
    @order.offer = @offer
    @order.user = current_user
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

  def accept
    @order = Order.find(params[:order_id])
    authorize @order
    @order.status = 'accepted'
    @order.save
    respond_to do |format|
      format.html { redirect_to order_path(@order) }
      format.json { render json: { expired_buttons: render_to_string(partial: "expired_buttons.html.erb", locals: { order: @order }) } }
    end
    
  end

  def reject
    @order = Order.find(params[:order_id])
    authorize @order
    @order.status = 'rejected'
    @order.save
    respond_to do |format|
      format.html { redirect_to order_path(@order) }
      format.json { render json: { expired_buttons: render_to_string(partial: "expired_buttons.html.erb", locals: { order: @order }) } }
    end
  end
end
