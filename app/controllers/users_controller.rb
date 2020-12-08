class UsersController < ApplicationController

  def  show
    @user = User.find(params[:id])
    @messages = Message.includes(:user).order('created_at DESC')
    @share_messages = ShareMessage.includes(:user)
  end

  def edit 

  end

  def update
    if current_user.update(user_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy 
    @user = User.find(params[:id])
    @user.destroy
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :occupation, :position, :email)
  end

end
