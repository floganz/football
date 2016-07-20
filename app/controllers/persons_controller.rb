class PersonsController < ApplicationController
  before_filter :authenticate_user!

  def profile
    @user = User.find current_user.id
    @tournament = User.user_tournaments current_user.id
    @team = Team.user_teams current_user.id
  end
end
