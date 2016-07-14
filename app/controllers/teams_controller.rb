class TeamsController < ApplicationController
  def new
  end

  def show
    @team=Team.find_by(id: params[:id])
    if @team.nil?
      flash[:notice]='not found'
      render 'index'
    end
  end

  def edit
  end

  def create
    @team=Team.new(team_params)
    if @team.save
      flash[:notice]="success"
      redirect_to @team
    else
      flash[:notice]="smt wrong"
      render 'new'
    end
  end

  def update
    @team=Team.update(params[:id],:name => params[:team][:name])
    if @team.save
      flash[:notice]="all ok"
      redirect_to @team
    else
      flash[:notice]="smt wrong"
      render "edit"
    end
  end

  def team_params
    params.require(:team).permit(:first_user_id, :second_user_id, :name)
  end
end
