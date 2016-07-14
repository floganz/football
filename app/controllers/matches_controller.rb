class MatchesController < ApplicationController
  def new
  end

  def show
    @match=Match.find_by(id: params[:id])
    if @match.nil?
      flash[:notice]="not found"
      render 'index'
    end
  end

  def edit
  end

  def update
    @match=Match.update(params[:id],:first_team_goals => params[:match][:first_team_goals],
      :second_team_goals => params[:match][:second_team_goals])
    if @match.save
      flash[:notice]='ok'
      redirect_to @match
    else
      flash[:notice]="smt wrong"
      render 'edit'
    end
  end

  def create
    @match=Match.new(match_params)
    if @match.save
      flash[:notice]="Success"
      redirect_to @match
    else
      flash[:notice]="smt wrong"
      render 'new'
    end
  end

  def match_params
    params.require(:match).permit(:first_team_id, :second_team_id, :first_team_goals, :second_team_goals)
  end
end
