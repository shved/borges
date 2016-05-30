class GameSessionsController < ApplicationController
  def index
    render :index
  end

  def new
    @game_type = params[:game_type]
    @game = Game.find_by(game_type: @game_type)
  end
end
