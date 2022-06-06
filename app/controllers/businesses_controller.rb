class BusinessesController < ApplicationController
  skip_after_action :verify_authorized
  def new
    @business = Business.new()
  end

  def create
    @business.user = current_user
  end
end
