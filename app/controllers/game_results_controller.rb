class GameResultsController < ApplicationController
  def index
    render :index
  end

  def new
    @game_type = params[:game_type]
  end
end
