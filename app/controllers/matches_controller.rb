class MatchesController < ApplicationController
  def show
    @match=Match.find_by id: params[:id]
    if @match.nil?
      flash[:notice] = "Match not found"
      render 'index'
    end
    flash[:first_team_name] = Team.find_by(id: @match.first_team_id).name
    flash[:second_team_name] = Team.find_by(id: @match.second_team_id).name
  end

  def update
    #@match=Match.update(params[:id],:first_team_goals => params[:match][:first_team_goals],
    #  :second_team_goals => params[:match][:second_team_goals])
    @match = Match.update params[:id], match_params
    if @match.save
      flash[:notice] = "Changes saved"
      redirect_to @match
    else
      flash[:notice] = "Something went wrong, try again"
      render 'edit'
    end
  end

  def create
    @match = Match.new match_params
    if @match.save
      flash[:notice] = ""
      redirect_to @match
    else
      flash[:notice] = "Something went wrong, try again"
      render 'new'
    end
  end

  def match_params
    params.require(:match).permit(:first_team_id, :second_team_id,
      :first_team_goals, :second_team_goals)
  end
end
