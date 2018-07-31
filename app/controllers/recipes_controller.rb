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
        @recipe.recipe_ingredients.build(input_name: 'flour', quantity: '2 cups')
        @recipe.recipe_ingredients.build(input_name: 'sugar', quantity: '1 cup')
    end

    def edit
    end

    private

        def set_recipe
            @recipe = Recipe.find(params[:id])
        end

        def recipe_params
            params.require(:recipe).permit(:name, :prep_time, :cook_time, recipe_ingredients_attributes:
            [:input_name, :quantity], directions_attributes: [:name]
            )
        end

end
