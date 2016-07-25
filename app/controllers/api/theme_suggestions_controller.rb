module Api
  class ThemeSuggestionsController < ApplicationController
    def suggest
      @suggestion = ThemeSuggestion.order('RANDOM()').limit(1)
      render json: @suggestion.to_json
    end
  end
end
