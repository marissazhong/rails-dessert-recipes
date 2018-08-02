class Recipe < ActiveRecord::Base
    has_many :recipe_ingredients
    has_many :ingredients, :through => :recipe_ingredients
    belongs_to :user
    accepts_nested_attributes_for :recipe_ingredients
    validates :name, presence: true

    def recipe_ingredients_attributes=(recipe_ingredients_attributes)
        recipe_ingredients_attributes.values.each do |recipe_ingredients_attribute|
            ingredient = Ingredient.find_or_create_by(name: recipe_ingredients_attribute[:input_name].downcase)
            recipe_ingredient = RecipeIngredient.create(recipe_ingredients_attribute)
            # self.recipe_ingredients << recipe_ingredient
        end
    end
end