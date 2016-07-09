module Api
  class ThemeSuggestionsController < ApplicationController
    def suggest
      @suggestion = ThemeSuggestion.all.sample
      render json: @suggestion.to_json
    end
  end
end
