class PantriesController < ApplicationController
    before_action :set_pantry
    before_action :set_ingredients, only: [:edit, :update]
    before_action :require_logged_in

    def show
    end

    def edit
    end

    def update
        if params[:pantry][:ingredient_ids] != ""
            params[:pantry][:ingredient_ids].each do |ingredient_id|
                @pantry.ingredients << Ingredient.where(id: ingredient_id)
            end
            @pantry.save
        end
        redirect_to pantry_path(@pantry)
    end

    def destroy
        @ingredient = Ingredient.find(params[:ingredient_id])
        @pantry.ingredients.delete(@ingredient)
        redirect_to pantry_path(@pantry)
    end

    private

    def set_pantry
        @user = current_user
        @pantry = Pantry.find_by(user_id: @user.id)
    end

    def set_ingredients
        @ingredients = Ingredient.all
    end

end