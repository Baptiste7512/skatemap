class SkatespotsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index
  def index
    @skatespots = Skatespot.all

    @markers = @skatespots.geocoded.map do |skatespot|
      {
        lat: skatespot.latitude,
        lng: skatespot.longitude,
        info_window: render_to_string(partial: "info_window", locals: {skatespot:skatespot }),
      }
    end
  end

  def show
    @skatespot = Skatespot.find(params[:id])
    @conversation = Conversation.new
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

  def destroy
    @skatespot = Skatespot.find(params[:id])
    @skatespot.destroy
    redirect_to '/skatespots/new', :notice => "Your skatespot has been deleted"
  end

  private

  def skatespot_params
    params.require(:skatespot).permit(:name, :address, :photo)
  end
end
