class SessionsController < ApplicationController
  def new
    render :new
  end

  def create
    user = self.login_user!
    #return user ? session[:session_token] = user.reset_session_token! : render(:new)
    if user
      session[:session_token] = user.reset_session_token!
      redirect_to cats_url
    else
      render(:new)
    end
  
  end

  def destroy
    logout!
    redirect_to new_session_url
  end
end
