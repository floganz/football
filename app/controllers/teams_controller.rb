class TeamsController < ApplicationController
  def show
    @team = Team.find_by id: params[:id]
    if @team.nil?
      flash[:notice] = "Team not found"
      render 'index'
    end
    flash[:notice] = "Great, found"
    _first_user = User.find_by id: @team.first_user_id
    flash[:first_user_name] = "#{ _first_user.surname } #{ _first_user.name }"
    _second_user = User.find_by id: @team.second_user_id
    flash[:second_user_name] = "#{ _second_user.surname } #{ _second_user.name }"
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
    #@team=Team.update(params[:id],:name => params[:team][:name])
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
    #if !params[:team][:name].nil?
      @team = Team.find_by name: params[:team][:name]
    #end
    flash[:notice] = ""
    if @team.nil?
      flash[:notice] = "Team not found"
    end
      render 'index'    
  end

  def team_params
    params.require(:team).permit(:first_user_id, :second_user_id, :name)
  end
end
