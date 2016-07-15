class RoundsController < ApplicationController
  def create
    @round=Round.new round_params
    if @round.save
      flash[:notice] = ""
      redirect_to @round
    else
      flash[:notice] = "Something went wrong, try again"
      render "new"
    end
  end

  def show
    @round = Round.find_by id: params[:id]
    if @round.nil?
      flash[:notice] = "Round not found"
      render "index"
    end
    flash[:tournament_name] = Tournament.find_by(id: @round.tournament_id).name
  end

  def update
    #@round=Round.update(params[:id],:name => params[:round][:name], 
    #  :round_type => params[:round][:round_type], :order => params[:round][:order])
    @round = Round.update params[:id], round_params
    if @round.save
      flash[:notice] = "Changes saved"
      redirect_to @round
    else
      flash[:notice] = "Something went wrong, try again"
      render "edit"
    end
  end

  def round_params
    params.require(:round).permit(:tournament_id, :name, :round_type, :order)
  end
end
