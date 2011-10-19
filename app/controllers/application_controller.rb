class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :current_user, :user_signed_in?, :authenticate_user!

protected

  def current_user
    @current_user ||= User.find_by_id(session[:user_id])
  end

  def user_signed_in?
    !!current_user
  end


  def current_user=(user)
    @current_user = user
    session[:user_id] = user.id
  end

  def authenticate_user!
    if !current_user
      flash[:error] = 'You need to sign in before accessing this page!'
      redirect_to [:login, :authentications]
    end
  end  
  

end
