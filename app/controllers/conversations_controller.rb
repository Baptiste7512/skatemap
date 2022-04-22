class ConversationsController < ApplicationController
  def create
    @skatespot = Skatespot.find(params[:skatespot_id])
    @conversation = Conversation.new(conversation_params)
    @conversation.skatespot = @skatespot
    if @conversation.save
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
