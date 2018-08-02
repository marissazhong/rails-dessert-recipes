class Ingredient < ActiveRecord::Base
    has_many :ingredients_recipe
    has_many :recipes, :through => :ingredients_recipe
end