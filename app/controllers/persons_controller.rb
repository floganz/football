class PersonsController < ApplicationController
  before_filter :authenticate_user!

  def profile
    @user = User.find current_user.id
    @tournament = User.tournaments current_user.id
    @team = User.teams current_user.id
  end
end
