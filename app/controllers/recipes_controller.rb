class RecipesController < ApplicationController
    before_action :set_recipe, only: [:show, :edit, :update, :destroy]
    before_action :set_user
    before_action :require_logged_in

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
        @recipe = @user.recipes.build(recipe_params)
        @recipe.directions = params[:recipe][:directions].values

        if @recipe.save
            redirect_to recipe_path(@recipe)
        else
            render :new
        end

    end

    def edit
    end

    def update
        @recipe.update(recipe_params)
        @recipe.directions = params[:recipe][:directions].values
        @recipe.save
        redirect_to recipe_path(@recipe)
    end

    def destroy
        @recipe.destroy
        redirect_to user_path(@user)
    end

    private

        def set_recipe
            @recipe = Recipe.find(params[:id])
        end

        def set_user
            @user = current_user
        end

        def recipe_params
            params.require(:recipe).permit(:name, :prep_time, :cook_time, ingredients_recipes_attributes: [:input_name, :quantity])
        end

end
