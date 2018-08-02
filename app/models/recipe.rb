class Recipe < ActiveRecord::Base
    has_many :ingredients_recipes
    has_many :ingredients, :through => :ingredients_recipes
    belongs_to :user
    accepts_nested_attributes_for :ingredients_recipes
    validates :name, presence: true
end