class UsersController < ApplicationController
  def show
    @user = User.find_by id: params[:id]
    if @user.nil?
      flash[:notice] = "User not found"
      render "index"
    end
  end

  def update
    #@user = User.update(params[:id],:name => params[:user][:name],:surname => params[:user][:surname],:email => params[:user][:email],:photo => params[:user][:photo])
    @user = User.update params[:id], user_params    
    if @user.save
      redirect_to @user
    end
  end

  def create
    @user = User.new user_params
    if @user.save
      flash[:notice] = ""
      redirect_to @user
    else
      flash[:notice] = "Something went wrong, try again"
      render "new"
    end
  end

  def user_params
    params.require(:user).permit(:name, :surname, :email, :photo)
  end
end
