module Api
  class ThemeSuggestionsController < ApplicationController
    def suggest
      random_id = ThemeSuggestion.select(:id).order('RANDOM()').limit(1).first.id
      @suggestion = ThemeSuggestion.find(random_id)
      render json: @suggestion.to_json
    end
  end
end
