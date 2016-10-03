class LikesController < ApplicationController
  before_action :authenticate_author!

  def create
    @game_session = GameSession.find(params[:game_session_id])
    @like = @game_session.likes.new(author_id: current_author.id)
    if @like.save
      render 'create'
    end
  end
end
