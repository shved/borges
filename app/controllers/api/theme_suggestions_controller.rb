module Api
  class ThemeSuggestionsController < ApplicationController
    def suggest
      limit = ThemeSuggestion.count + 1
      @suggestion = ThemeSuggestion.find(limit)
      render json: @suggestion.to_json
    end
  end
end
