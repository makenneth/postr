class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_user
    @current_user ||= User.find_by(
    session_token: session[:session_token]
    )
  end

  def is_logged_in?
   !!current_user
  end

  def redirect_unless_logged_in!
    redirect_to new_session_url unless is_logged_in?
  end

  def log_in!(user)
     user.reset_session_token!
     session[:session_token] = user.session_token
  end
  helper_method :current_user
end
