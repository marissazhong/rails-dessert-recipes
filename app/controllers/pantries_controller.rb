class PantriesController < ApplicationController
    before_action :set_pantry
    before_action :set_ingredients, only: [:edit, :update]
    before_action :require_logged_in

    def show
    end

    def edit
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