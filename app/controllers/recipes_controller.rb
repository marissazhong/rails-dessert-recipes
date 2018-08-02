class RecipesController < ApplicationController
    before_action :set_recipe, only: [:show, :edit]
    before_action :set_user

    # /recipes index page showing user's recipes and all recipes
    def index
        @recipes = Recipe.all
        render :'users/show'
    end

    def show
    end

    def new
        @recipe = Recipe.new
        @recipe.ingredients_recipes.build(input_name: 'flour', quantity: '2 cups')
    end

    def create
        @recipe = @user.recipes.build(recipe_params(:name, :prep_time, :cook_time))
        @recipe.directions = params[:recipe][:directions].values
        
        # find or create ingredient by name
        params[:recipe][:ingredients_recipes_attributes].each do |k,v|
            ingredient = Ingredient.find_or_create_by(name: v["input_name"].downcase)
            # if !ingredient
            #     RecipeIngredient.create(input_name: v["input_name"], quantity: v["quantity"])
            #     ingredient = @recipe.ingredients.create(name: v["input_name"].downcase)
            # end
            @recipe.ingredients_recipes.build(ingredient_id: ingredient.id, recipe_id: @recipe.id, input_name: v["input_name"], quantity: v["quantity"])
        end

        if @recipe.save
            redirect_to recipe_path(@recipe)
        else
            render :new
        end

    end

    def edit
    end

    private

        def set_recipe
            @recipe = Recipe.find(params[:id])
        end

        def set_user
            @user = current_user
        end

        def recipe_params(*args)
            params.require(:recipe).permit(*args)
        end

end
