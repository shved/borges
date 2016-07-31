module Api
  class ThemeSuggestionsController < ApplicationController
    def suggest
      @prev_suggestion_id = params[:suggestion_id]
      @game_type = params[:game_type]
      @suggestion = ThemeSuggestion.send(@game_type.to_sym).where.not(id: @prev_suggestion_id).order('RANDOM()').limit(1).first
      render json: @suggestion.to_json
    end
  end
end
