class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:userid] = user.id
      redirect_to products_url, notice: "Logged in!"
    else
      render "new"
    end
  end

  def destroy
    session[:userid] = nil
    redirect_to products_url, notice: "logged out!"
  end
end
