class UsersController < ApplicationController
  before_action :authenticate_user!
  
def index
  @users = User.all
  @matches = Match.all

end

  def show
    @user = User.find(params[:id])
  end


  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to(@user)
  end



private
  def user_params
    params.require(:user).permit(:name, :description, :image)
  end

end
