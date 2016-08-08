class GameSessionsController < ApplicationController
  before_action :authenticate_user!, only: [:create]

  def index
    @game_sessions = GameSession.order(created_at: :desc)
    @game_sessions = @game_sessions.where(author_id: params[:author_id]) if params[:author_id]
    @game_sessions = @game_sessions.where(game: params[:game_id]) if params[:game_id]
    @game_sessions = @game_sessions.take(10)
  end

  def start
    @game_type = params[:game_type]
    @game = Game.find_by(game_type: @game_type)
    @game_sessions = GameSession.limit(25)
  end

  def new
    @game_type = params[:game_type]
    @props = params[:props]
    @game = Game.send(params[:game_type].to_sym)
    @game_session = GameSession.new(game: @game, props: @props)
  end

  def create
    @author = Author.last
    @game_session = @author.game_sessions.new(game_session_params)
    if @game_session.save!
      flash[:notice] = 'saved successfully!'
      render json: { redirect_path: game_sessions_path }
    else
      flash[:warning] = @game_session.errors.full_messages.first
      render json: { redirect_path: game_sessions_path }
    end
  end

  private

  def game_session_params
    params.require(:game_session).permit(:text, :game_id, :props)
  end
end
