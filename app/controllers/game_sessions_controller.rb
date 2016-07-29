class GameSessionsController < ApplicationController
  def index
    @game_sessions = GameSession.order(created_at: :desc).take(10)
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
    # @author.game_sessions.create(...)
    # redirect_to :index, author: @author
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
