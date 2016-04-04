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

  def is_super_admin?
     current_user.super_admin?
  end

  def is_mod_to_sub?
     @sub.moderators.include?(current_user)
  end

  def redirect_unless_is_mod!
     redirect_to subs_url unless is_mod_to_sub?
  end

  def redirect_unless_logged_in!
    redirect_to new_session_url unless is_logged_in?
  end

  def log_in!(user)
     user.reset_session_token!
     session[:session_token] = user.session_token
  end

  helper_method :current_user, :is_super_admin?, :is_mod_to_sub?
end
