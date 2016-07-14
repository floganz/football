class TournamentsController < ApplicationController
  def index
  end

  def new
  end

  def show
    @tournament=Tournament.find_by(id: params[:id])
    if @tournament.nil?
      flash[:alert]="Tournament not found"
      render "index"
    end
  end

  def edit
  end

  def create
    @tournament=Tournament.new(tournament_params)
    if @tournament.save
      flash[:notice]=""
      redirect_to @tournament
    else
      flash[:notice]="Smt went wrong, try again"
      render "new"
    end
  end

  def tournament_params
    params.require(:tournament).permit(:name, :status)
  end
end
