class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :ui_kit ]

  def home
    @categories = %w(furniture textiles decoration kitchenware\ &\ dinnerware take\ away pots\ &\ plants outdoor)
  end

  def ui
  end
end
