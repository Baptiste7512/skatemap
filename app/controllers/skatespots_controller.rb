class SkatespotsController < ApplicationController

  def index
    @skatespots = Skatespot.all

    @markers = @skatespots.geocoded.map do |skatespot|
      {
        lat: skatespot.latitude,
        lng: skatespot.longitude
      }
    end
  end

  def show
    @skatespot = Skatespot.find(params[:id])
  end

  def new
    @skatespot = Skatespot.new
  end

  def create
    @skatespot = Skatespot.new(skatespot_params)

    if @skatespot.save
      redirect_to @skatespot
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def skatespot_params
    params.require(:skatespot).permit(:name, :address, :photo)
  end
end
