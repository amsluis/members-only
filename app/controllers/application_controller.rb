class ApplicationController < ActionController::Base

  def log_in(user)
    user.remember
    cookies.permanent[:remember_token] = user.remember_token
    set_current_user(user)
  end

  def current_user
    @current_user ||= User.find_by(remember_digest:
                                   Digest::SHA1.hexdigest(cookies[:remember_token]))
  end

  def set_current_user(user)
    @current_user = user
  end

  def sign_out
    cookies.delete(:remember_token)
  end

  def logged_in?
    !current_user.nil?
  end

end
