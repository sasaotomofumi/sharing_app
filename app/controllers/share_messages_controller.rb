class ShareMessagesController < ApplicationController

  before_action :set_seggestions, only: [:index, :create]
  before_action :set_seggestion, only: [:index, :create, :destroy, :edit, :update]
  before_action :set_share_message, only: [:destroy, :edit, :update]

  def index
    @share_message = ShareMessage.new
    @share_messages = @suggestion.share_messages.includes(:user)
  end

  def create
    @share_message = @suggestion.share_messages.new(shre_message_params)
    if @share_message.save
      redirect_to suggestion_share_messages_path(@suggestion)
    else
      @share_messages = @suggestion.share_messages.includes(:user)
      render :index
    end
  end

  def destroy
    @share_message.destroy
    redirect_back(fallback_location: root_path)
  end

  def edit
  end

  def update
    if @share_message.update(shre_message_params)
      redirect_to suggestion_share_messages_path(@suggestion)
    else
      render :edit
    end
  end

  private

  def shre_message_params
    params.require(:share_message).permit(:content, :image).merge(user_id: current_user.id)
  end

  def set_seggestions
    @suggestions = Suggestion.all
  end

  def set_seggestion
    @suggestion = Suggestion.find(params[:suggestion_id])
  end

  def set_share_message
    @share_message = @suggestion.share_messages.find(params[:id])
  end
  
end
