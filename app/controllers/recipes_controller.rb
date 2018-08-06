class RecipesController < ApplicationController
    before_action :require_logged_in
    before_action :set_recipe, only: [:show, :edit, :update, :destroy]
    before_action :set_user
    before_action :check_user, only: [:edit, :update, :destroy]

    # index page showing user's recipes and all recipes
    def index
        @recipes = Recipe.all
        redirect_to user_path(@user) # user home page
    end

    # shows individual recipe
    def show
    end

    # shows new recipe form
    def new
        @recipe = Recipe.new
        @recipe.ingredients_recipes.build(input_name: 'flour', quantity: '2 cups')
    end

    # creates new recipe
    def create
        @recipe = @user.recipes.build(recipe_params)
        @recipe.directions = params[:recipe][:directions].values.delete_if {|v| v.empty?}
        if @recipe.save
            redirect_to recipe_path(@recipe)
        else
            render :new
        end

    end

    # shows edit recipe form
    def edit
    end

    # updates recipe
    def update
        @recipe.update(recipe_params)
        @recipe.directions = params[:recipe][:directions].values.delete_if {|v| v.empty?}
        if @recipe.save
            redirect_to recipe_path(@recipe)
        else
            render :edit
        end
    end

    # deletes recipe
    def destroy
        @recipe.destroy
        redirect_to user_path(@user)
    end

    def fastest
        @recipes = Recipe.fastest
    end

    private

        def check_user
            @user = User.find(@recipe.user_id)
            if @user != current_user
                redirect_to user_path(current_user)
            end
        end

        def recipe_params
            params.require(:recipe).permit(:name, :prep_time, :cook_time, ingredients_recipes_attributes: [:input_name, :quantity])
        end

end
