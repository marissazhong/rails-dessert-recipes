class IngredientsController < ApplicationController
    before_action :authenticate_user!

    def new
        @ingredient = Ingredient.new
    end

    def create
        @ingredient = Ingredient.create(name: params[:name])
    end
end
