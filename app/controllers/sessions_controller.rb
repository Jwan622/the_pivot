class SessionsController < ApplicationController
  def create
    user = User.find_by(username: params[:session][:username])
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      redirect_to root_url
    else
      flash[:errors] = 'Invalid Login'
      redirect_to root_url
    end
  end

  def destroy
    session.clear
    flash[:notice] = "You have successfully logged out"
    redirect_to root_url
  end
end
