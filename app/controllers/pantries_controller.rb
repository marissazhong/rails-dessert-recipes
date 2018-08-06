class PantriesController < ApplicationController
    before_action :require_logged_in
    before_action :set_pantry
    before_action :set_ingredients, only: [:edit, :update]
    before_action :check_user

    # shows recipes for which pantry includes all ingredients
    def show
        @recipes = Recipe.all_by_pantry(@pantry.id)
    end

    # shows edit pantry form
    def edit
    end

    # updates pantry based on pantry form parameters
    def update
        # Adds pantry's ingredients based on checked boxes
        if params[:pantry][:ingredient_ids] != ""
            params[:pantry][:ingredient_ids].each do |ingredient_id|
                @pantry.ingredients << Ingredient.where(id: ingredient_id)
            end
            @pantry.save
        end
        # Finds or adds new ingredients based on filled text fields
        if params[:pantry][:ingredients] != ""
            params[:pantry][:ingredients].each do |k,v|
                if v != ""
                    @pantry.ingredients << Ingredient.find_or_create_by(name: v.downcase)
                end
            end
        end
        redirect_to pantry_path(@pantry)
    end

    # deletes individual ingredient from pantry
    def destroy
        @ingredient = Ingredient.find(params[:ingredient_id])
        @pantry.ingredients.delete(@ingredient)
        redirect_to pantry_path(@pantry)
    end

    private

    def check_user
        @user = User.find(params[:id])
        if @user != current_user
          redirect_to pantry_path(current_user)
        end
    end

    def set_pantry
        @user = current_user
        @pantry = Pantry.find_by(user_id: @user.id)
    end

    def set_ingredients
        @ingredients = Ingredient.all
    end

end