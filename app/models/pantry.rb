class Pantry < ActiveRecord::Base
    belongs_to :user
    has_many :ingredients_pantries
    has_many :ingredients, through: :ingredients_pantries
end