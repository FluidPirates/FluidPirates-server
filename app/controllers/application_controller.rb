class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def set_current_user(user)
    session[:current_user_id] = user.try(:id)
  end

  def current_user
    return unless session[:current_user_id]
    @current_user ||= User.find_by_id(session[:curent_user_id])
  end
end
