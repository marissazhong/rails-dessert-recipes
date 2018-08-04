class Ingredient < ActiveRecord::Base
    has_many :ingredients_recipe
    has_many :recipes, :through => :ingredients_recipe
    has_many :ingredients_pantries
    has_many :pantries, through: :ingredients_pantries
    validates :name, presence: true
    def titleize
        name.titleize
    end
end