class ConversationsController < ApplicationController
  skip_before_action :authenticate_user!, only: :create

  def create
    @conversation = Conversation.new(conversation_params)
    @skatespot = Skatespot.find(params[:skatespot_id])
    @conversation.skatespot = @skatespot
    @conversation.user = current_user

    if @conversation.save!
      redirect_to skatespot_path(@skatespot)
    else
      render 'skatespots/show'
    end
  end

  private

  def conversation_params
    params.require(:conversation).permit(:content)
  end
end
