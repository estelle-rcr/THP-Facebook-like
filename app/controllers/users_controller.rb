class UsersController < ApplicationController
  def show
    @author = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new('first_name' => params[:first_name],'last_name' => params[:last_name],'age' => params[:age],'email' => params[:email],'description' => params[:description], 'password' => params[:password], 'password_confirmation' => params[:password_confirmation])
    @user.city = City.find_by(zip_code: params[:zip_code])
      if @user.save
        flash[:success] = "Your account has been created!"
        log_in(@user)
        redirect_to root_path
      else
        render 'new'
      end  
  end

end
