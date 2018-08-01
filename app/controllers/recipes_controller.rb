class RecipesController < ApplicationController
    before_action :set_recipe, only: [:show, :edit]

    # /recipes index page showing user's recipes and all recipes
    def index
        @recipes = Recipe.all
    end

    def show
    end

    def new
        @recipe = Recipe.new
        @recipe.recipe_ingredients.build(input_name: 'flour', quantity: '2 cups')
    end

    def create
        @recipe = Recipe.new(recipe_params)

        # # combine directions into one string
        # combined = ""
        # params[:recipe][:directions].each do |k,v|
        #     combined += (k.to_i+1).to_s + ". " + v + "<br \>"
        # end
        # @recipe.directions = combined

        # # find or create ingredient by name
        # params[:recipe][:recipe_ingredients_attributes].each do |k,v|
        #     ingredient = Ingredient.all.find_by(name: v["input_name"].downcase)
        #     if !ingredient
        #         ingredient = Ingredient.create(name: v["input_name"].downcase)
        #     end
        #     @recipe.ingredients << ingredient
        # end

        @recipe.save
        redirect_to recipe_path(@recipe)

    end

    def edit
    end

    private

        def set_recipe
            @recipe = Recipe.find(params[:id])
        end

        def recipe_params
            params.require(:recipe).permit(:name, :prep_time, :cook_time)
        end

end
