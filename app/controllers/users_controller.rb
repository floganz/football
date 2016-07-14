class UsersController < ApplicationController
  def new
  end

  def show
    @user=User.find(params[:id])
  end

  def edit
  end

  def update
    @user=User.update(params[:id],:name => params[:user][:name],:surname => params[:user][:surname],:email => params[:user][:email],:photo => params[:user][:photo])
    @user.save

  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to @user
      flash[:notice]=""
    else
      flash[:notice]="Smt went wrong!"
      render "new"
    end
  end

  def user_params
    params.require(:user).permit(:name, :surname, :email, :photo)
  end
end
