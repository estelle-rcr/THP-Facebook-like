class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
      log_in(@user)
      if params[:keep_login] 
        remember(@user)
      end
      flash[:success] = "Welcome #{@user.first_name}, you're logged in!"
      redirect_to root_path
    else
      @user = User.new
      flash[:danger] = "Invalid login or password."
      render 'sessions/new'
  end
end

  def destroy 
    log_out(@user)
    flash[:success] = "You're logged out, bye!"
    redirect_to root_path
  end

end
