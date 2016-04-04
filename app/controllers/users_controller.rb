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

  def add_new_admin
     @user = User.find(params[:user_id])
     @user.toggle(:admin)
     redirect_to users_url
  end

  def remove_admin
     @user = User.find(params[:user_id])
       @user.toggle(:admin)
     redirect_to users_url
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end

end
