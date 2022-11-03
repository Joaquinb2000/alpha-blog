class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)

    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:notice] = "Succesfully logged in"
      redirect_to user
    else
      flash.now[:alert]= "Incorrect email or password."
      render 'new'
    end
  end

  def delete
    session[:user_id] = nil
    flash[:notice] = "Logged out"
    redirect_to root_path
  end
end
