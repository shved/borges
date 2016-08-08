module Api
  class PendingGameSessionsController < ApplicationController
    def create
      @pending_game_session = PendingGameSession.new(pending_game_session_params)
      @pending_game_session.hex = SecureRandom.hex(32)
      if @pending_game_session.save!
        render json: { redirect_path: new_author_registration_path, hex: @pending_game_session.hex }
      else
        render :nothing
      end
    end

    private

    def pending_game_session_params
      params.require(:pending_game_session).permit(:game_id, :text, :props, :hex)
    end
  end
end
