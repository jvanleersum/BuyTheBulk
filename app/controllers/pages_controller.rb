class PagesController < ApplicationController
  skip_before_action :authenticate_user!

  def home
    @categories = %w(furniture textiles decoration kitchenware\ &\ dinnerware take\ away pots\ &\ plants outdoor)
  end

  def splash
  end

  def landing
  end
end
