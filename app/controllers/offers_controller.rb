class OffersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  def index
    if params[:query].present?
      sql_query = 'name ILIKE :query OR description ILIKE :query'
      @offers = policy_scope(Offer).where(sql_query, query: "%#{params[:query]}%").order(deadline: :desc)
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
  end

  def create

  end
end
