class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @skatespots = Skatespot.all
  end

  def dashboard
    @user = current_user
  end

  def actuality
  end
end
