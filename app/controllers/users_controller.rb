class UsersController < ApplicationController
  def new
    @user=User.new
  end

  def show
    @user=User.find(params[:id])
  end

  def edit
  end

  def create
    @user=User.new
    @user.name=params[:users][:name]
    @user.surname=params[:users][:surname]
    @user.email=params[:users][:email]
    @user.photo=params[:users][:photo]
    @user.rang=15
    @user.save
  end
end
