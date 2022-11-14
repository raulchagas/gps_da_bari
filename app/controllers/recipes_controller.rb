class RecipesController < ApplicationController

    def index
      if params[:query].present?
        sql_query = "title ILIKE :query OR description ILIKE :query"
        @recipes = Recipe.where(sql_query, query: "%#{params[:query]}%")
      else
        @recipes = Recipe.all
      end
    end

  def show
    @recipe = Recipe.find(params[:id])
  end

end
