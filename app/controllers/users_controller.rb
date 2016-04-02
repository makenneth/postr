class UsersController < ApplicationController
   def index
      @users = User.all
      render :index
   end
  def new
    render :new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to subs_url
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end

end
