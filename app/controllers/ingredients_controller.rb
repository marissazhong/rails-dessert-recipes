class IngredientsController < ApplicationController
    before_action :authenticate_user!

    def new
        @ingredient = Ingredient.new
    end
end
