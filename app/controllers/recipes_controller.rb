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
            params.require(:recipe).permit(:name, :prep_time, :cook_time, ingredients_attributes:
            [:ingredient_1, :quantity_1, :ingredient_2, :quantity_2, :ingredient_3, :quantity_3, :ingredient_4, :quantity_4, :ingredient_5, :quantity_5, :ingredient_6, :quantity_6, :ingredient_7, :quantity_7, :ingredient_8, :quantity_8, :ingredient_9, :quantity_9, :ingredient_10, :quantity_10]
            )
        end

end
