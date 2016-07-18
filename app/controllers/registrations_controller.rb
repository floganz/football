class RegistrationsController < Devise::RegistrationsController
  def new
    super
  end

  def create
    # add custom create logic here
    @user = User.new user_params
    if @user.save
      flash[:notice] = ""
      #redirect_to @user
    else
      flash[:notice] = "Something went wrong, try again"
      #render "new"
    end
  end

  def update
    super
  end

  # def after_sign_up_path_for(resource)
  #   '/persons/profile' # Or :prefix_to_your_route
  # end

  def user_params
    params.require(:user).permit(:name, :surname, :email, :photo, :password, :password_confirmation)
  end
end 