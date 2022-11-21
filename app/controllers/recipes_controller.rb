class RecipesController < ApplicationController

    def index
      if params[:query].present?
        sql_query = params[:query]
        # @recipes = Recipe.where(sql_query, query: "%#{params[:query]}%")
        response = HTTParty.get("https://api.edamam.com/api/recipes/v2?type=public&q=#{sql_query}&app_id=6b0dad4e&app_key=f84be2e85d0919a734759ee45945a44d&imageSize=REGULAR")

        @recipes = response["hits"]
      else
        response = HTTParty.get("https://api.edamam.com/api/recipes/v2?type=public&app_id=6b0dad4e&app_key=f84be2e85d0919a734759ee45945a44d&imageSize=REGULAR&random=true")

        @recipes = response["hits"]
      end
    end

  def show
    recipe_response = HTTParty.get("https://api.edamam.com/api/recipes/v2/#{params[:id]}?type=public&app_id=6b0dad4e&app_key=%20f84be2e85d0919a734759ee45945a44d%09")
    @recipe = recipe_response["recipe"]
  end

end


HTTParty.get("https://api.edamam.com/api/recipes/v2/22bdade1e325d1ed3dcefa7d901c9a45?type=public&app_id=6b0dad4e&app_key=%20f84be2e85d0919a734759ee45945a44d%09")
