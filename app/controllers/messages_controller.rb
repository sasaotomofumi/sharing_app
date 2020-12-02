class MessagesController < ApplicationController

   before_action :set_seggestions, only: [:index, :create]

  def index
    @message = Message.new
    @room = Room.find(params[:room_id])
    @messages = @room.messages.includes(:user)
  end

  def create
    @room = Room.find(params[:room_id])
    @message = @room.messages.new(message_params)
    if @message.save
      redirect_to room_messages_path(@room)
    else
      @messages = @room.messages.includes(:user)
      render :index
    end
  end

  def destroy
    room = Room.find(params[:room_id])
    message = room.messages.find(params[:id])
    message.destroy
    redirect_to room_messages_path(room)
  end

  def edit
  end

  def update
  end

  private

  def message_params
    params.require(:message).permit(:content, :image).merge(user_id: current_user.id)
  end

  def set_seggestions
    @suggestions = Suggestion.all
  end

end
