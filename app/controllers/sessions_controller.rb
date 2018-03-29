class SessionsController < ApplicationController
  def new
  end

  def create
  	user = User.find_by(email: params[:session][:email].downcase)
  	if user && user.authenticate(params[:session][:password])
  		session[:user_id] = user.id
  		flash.now[:success] = "You've successfully logged in"
  		redirect_to user_path(user)
  	else
  		flash.now[:danger] = "There was an error with the information provided."
  		render :new
  	end
  end

  def destroy
  	session[:user_id] = nil
  	flash.now[:success] = "Logged Out"
  	redirect_to root_path
  end
end
