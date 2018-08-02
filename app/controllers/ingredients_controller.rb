class IngredientsController < ApplicationController

    def index
        @ingredients = Ingredient.all
        render layout: false
    end

    def new
        @ingredient = Ingredient.new
    end

    def create
        @ingredient = Ingredient.create(name: params[:name])
    end
    
end
