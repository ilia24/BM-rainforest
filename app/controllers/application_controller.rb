class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  def ensure_logged_in
      unless current_user
        flash[:alert] = "Please log in"
        redirect_to new_session_url
      end
    end
private

  def current_user
    if session[:user_id]
      @current_user = User.find(session[:user_id])
    end
  end

  # def current_user
  #   session[:user_id] && User.find(session[:user_id])
  # end

  helper_method :current_user
end
