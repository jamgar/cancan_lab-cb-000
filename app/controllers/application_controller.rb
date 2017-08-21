class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => exception.message
  end

  def require_login
    redirect_to root_path unless session.include? :user_id
  end

  def current_user
    User.find_by(id: session[:user_id])
  end
end
