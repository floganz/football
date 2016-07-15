class TournamentsController < ApplicationController
  def show
    @tournament = Tournament.find_by id: params[:id]
    if @tournament.nil?
      flash[:notice] = "Tournament not found"
      render "index"
    end
  end

  def create
    @tournament = Tournament.new tournament_params
    if @tournament.save
      flash[:notice] = ""
      redirect_to @tournament
    else
      flash[:notice] = "Something went wrong, try again"
      render "new"
    end
  end

  def update
    #@tournament=Tournament.update(params[:id],:name => params[:tournament][:name], :status => params[:tournament][:status])
    @tournament = Tournament.update params[:id], tournament_params
    if @tournament.save
      flash[:notice] = "Changes saved"
      redirect_to @tournament
    else
      flash[:notice] = "Something went wrong, try again"
      render "edit"
    end
  end

  def tournament_params
    params.require(:tournament).permit(:name, :status)
  end
end
