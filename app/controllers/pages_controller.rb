class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :ui_kit ]

  def home
    @categories = 
  end

  def ui
  end
end
