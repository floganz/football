class TeamsController < ApplicationController
  def show
    @team = Team.find_by id: params[:id]
    flash[:notice] = ''
    if @team.nil?
      flash[:notice] = "Team '#{params[:id]}' not found"
      render 'index'
    end
  end

  def create
    @team = Team.new team_params
    if @team.save
      flash[:notice] = ""
      redirect_to @team
    else
      flash[:notice] = "Something went wrong, try again"
      render 'new'
    end
  end

  def update
    @team = Team.update params[:id], team_params
    if @team.save
      flash[:notice] = "Changes saved"
      redirect_to @team
    else
      flash[:notice] = "Something went wrong, try again"
      render "edit"
    end
  end

  def search
    @team = Team.search params[:team][:keyword]
    if @team.size == 0
      flash[:notice] = "Nothing found for query '#{params[:team][:keyword]}'"
    end
    render 'index'
  end

  def team_params
    params.require(:team).permit(:first_user_id, :second_user_id, :name)
  end
end
