class RecipesController < ApplicationController

    def index
      if params[:query].present?
        sql_query = params[:query]
        # @recipes = Recipe.where(sql_query, query: "%#{params[:query]}%")
        response = HTTParty.get("https://api.edamam.com/api/recipes/v2?type=public&q=#{params[:query]}&app_id=#{ENV['ID_KEY']}&app_key=%20#{ENV['API_KEY']}&imageSize=REGULAR")

        @recipes = response["hits"]
      else
        response = HTTParty.get("https://api.edamam.com/api/recipes/v2?type=public&app_id=#{ENV['ID_KEY']}&app_key=%20#{ENV['API_KEY']}&imageSize=REGULAR")

        @recipes = response["hits"]
      end
    end

  def show
    recipe_response = HTTParty.get("https://api.edamam.com/api/recipes/v2/#{params[:id]}?type=public&app_id=#{ENV['ID_KEY']}&app_key=%20#{ENV['API_KEY']}%09")
    @recipe = recipe_response["recipe"]
  end

end
