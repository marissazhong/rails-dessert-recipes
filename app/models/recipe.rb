class Recipe < ActiveRecord::Base
    has_many :recipe_ingredients
    has_many :ingredients, :through => :recipe_ingredients
    belongs_to :user
    accepts_nested_attributes_for :recipe_ingredients
    validates :name, presence: true
end