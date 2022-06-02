class OffersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  def index
    if params[:query].present?
      sql_query = 'name ILIKE :query OR description ILIKE :query'
      @offers = policy_scope(Offer).where(sql_query, query: "%#{params[:query]}%").order(deadline: :desc)
    elsif params[:category].present?
      if params[:category].length > 1
        categories = params[:category].split("-").map { |c| "category ILIKE '#{c}'" }
        sql_query = categories.join(" OR ")
        @offers = policy_scope(Offer).where(sql_query).order(deadline: :desc)
      elsif params[:category] != "all"
        sql_query = 'category ILIKE :category'
        @offers = policy_scope(Offer).where(sql_query, category: "%#{params[:category]}%").order(deadline: :desc)
      else
        @offers = policy_scope(Offer).order(deadline: :desc)
      end
    else
      @offers = policy_scope(Offer).order(deadline: :desc)
    end

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
    @offer = Offer.find(params[:id])
    authorize @offer

    @offer.orders.each do |order|
      authorize order
      order.destroy
    end

    @offer.comments.each do |comment|
      comment.destroy
    end

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
