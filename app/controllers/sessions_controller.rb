class SessionsController < ApplicationController
  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.find_by_credentials(
      params[:user][:username],
      params[:user][:password]
    )
    if @user
      log_in!(@user)
      redirect_to subs_url
    else
      render :new
    end
  end

  def destroy
     @user.reset_session_token!
     session[:session_token] = nil
     redirect_to subs_url
  end
end
