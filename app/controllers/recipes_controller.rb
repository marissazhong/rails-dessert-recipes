class RecipesController < ApplicationController
    before_action :set_recipe, only: [:show, :edit, :update, :destroy]

    # /recipes index page showing user's recipes and all recipes
    def index
        @recipes = Recipe.all
    end

    def show
    end

    def new
        @recipe = Recipe.new
    end

    def edit
    end

    private

        def set_recipe
            @recipe = Recipe.find(params[:id])
        end

        def recipe_params
            params.require(:attraction).permit(:name)
        end

end
