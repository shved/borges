class GameSessionsController < ApplicationController
  def index
    render :index
  end

  def start
    @game_type = params[:game_type]
    @game = Game.find_by(game_type: @game_type)
    @game_sessions = GameSession.all.limit(25)
  end

  def new
    @game_type = params[:game_type]
    @props = params[:props]
    @game = Game.send(params[:game_type].to_sym)
    @game_session = GameSession.new(game: @game, props: @props)
  end

  def create

  end
end
