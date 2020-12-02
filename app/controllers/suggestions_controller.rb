class SuggestionsController < ApplicationController
  
  before_action :set_seggestion, only: [:show, :destroy, :update]
  before_action :set_seggestions, only: [:show, :index]

  def index
  end

  def new
    @suggestion = Suggestion.new
  end

  def create
    @suggestion = Suggestion.new(suggestion_params)
    if @suggestion.save
      redirect_to  suggestion_share_messages_path(@suggestion.id)
    else render :new
    end
  end

  def show
  end

  def destroy
    @suggestion.destroy
    redirect_to root_path
  end

  def edit
  end

  def update
    @suggestion.update
    redirect_to root_path
  end

  private

  def suggestion_params
    params.require(:suggestion).permit(:content, :purpose, :detail, :deadline).merge(user_id: current_user.id)
  end

  def set_seggestion
    @suggestion = Suggestion.find(params[:id])
  end

  def set_seggestions 
    @suggestions = Suggestion.all
  end
end
