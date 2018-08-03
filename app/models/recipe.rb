class Recipe < ActiveRecord::Base
    has_many :ingredients_recipes
    has_many :ingredients, :through => :ingredients_recipes
    belongs_to :user
    accepts_nested_attributes_for :ingredients_recipes
    validates :name, presence: true

    def ingredients_recipes_attributes=(ingredients_recipes_attributes)
        ingredients_recipes_attributes.values.each do |v|
            ingredient = Ingredient.find_or_create_by(name: v["input_name"].downcase)
            self.ingredients_recipes.build(ingredient_id: ingredient.id, recipe_id: self.id, input_name: v["input_name"], quantity: v["quantity"])
        end
    end
end