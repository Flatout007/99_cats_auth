class ApplicationController < ActionController::Base
  helper_method :current_user

  def current_user
    @current_user ||= User.find_by(session_token: session[:session_token])
  end
def login_user!
    @user = User.find_by_credentials(params[:user][:user_name], params[:user][:password])
end
  def logged_in?
    !!current_user
  end

  def logout!
    current_user.reset_session_token! if logged_in?
    session[:session_token] = nil
    @current_user = nil
  end

  def require_logged_in
    redirect_to cats_url unless logged_in?
      
  end
end
