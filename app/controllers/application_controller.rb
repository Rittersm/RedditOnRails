class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user

  private

  def current_user
    if session[:name]
      @current_user ||= User.find_by_name(session[:name])
    end
    @current_user
  end

  def disallow_user
    if current_user
      flash[:danger] = "You are already logged in"
      redirect_to root_path
    end
  end

  def require_user
    unless current_user
      flash[:danger] = "You must log in to do that"
      redirect_to new_user_path
    end
  end

end
