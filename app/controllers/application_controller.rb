class ApplicationController < ActionController::Base
  protect_from_forgery
  
  helper_method :current_user, :signed_in?
  
  private
  
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def signed_in?
    unless !session[:user_id].nil? && session[:user_id] == current_user.id 
      flash[:error] = "You must be signed in to access this page."
      redirect_to root_path
    end      
  end
  
end
