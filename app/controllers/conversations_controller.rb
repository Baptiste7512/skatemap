class ConversationsController < ApplicationController
  skip_before_action :authenticate_user!, only: :create

  def create
    @conversation = Conversation.new(conversation_params)
    @skatespot = Skatespot.find(params[:skatespot_id])
    @conversation.skatespot = @skatespot
    @conversation.user = current_user

    respond_to do |format|
      if @conversation.save!
        format.html { redirect_to skatespot_path(@skatespot) }
        format.json
      else
        format.html { render "skatespots/show" }
        format.json
      end
    end
  end

  private

  def conversation_params
    params.require(:conversation).permit(:content)
  end
end
