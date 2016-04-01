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
      @user.session_token = SecureRandom.urlsafe_base64
      @user.save
      session[:session_token] = @user.session_token
      redirect_to subs_url
    else
    end
  end

end
