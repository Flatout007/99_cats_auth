class SessionsController < ApplicationController
  def new
    render :new
  end

  def create
    debugger
    user = User.find_by_credentials(params[:user][:user_name], params[:user][:password])
    #return user ? session[:session_token] = user.reset_session_token! : render(:new)
    if user
      session[:session_token] = user.reset_session_token!
      redirect_to cats_url
    else
      render(:new)
    end
    p session
  end

  def destroy
    logout!
    redirect_to new_session_url
  end
end
