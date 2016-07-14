class RoundsController < ApplicationController
  def new
  end

  def create
    @round=Round.new(round_params)
    if @round.save
      flash[:notice]=''
      redirect_to @round
    else
      flash[:notice]="Smt went wrong"
      render "new"
    end
  end

  def show
  end

  def edit
  end

  def round_params
    params.require(:round).permit(:tournament_id, :name, :round_type, :order)
  end
end
