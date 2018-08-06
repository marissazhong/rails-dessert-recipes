class Recipe < ActiveRecord::Base
    has_many :ingredients_recipes
    has_many :ingredients, :through => :ingredients_recipes
    belongs_to :user
    accepts_nested_attributes_for :ingredients_recipes
    validates :name, presence: true
    validates :prep_time, presence: true, numericality: true
    validates :cook_time, presence: true, numericality: true

    def ingredients_recipes_attributes=(ingredients_recipes_attributes)
        if self.ingredients_recipes
            IngredientsRecipe.where(recipe_id: self.id).delete_all
        end
        ingredients_recipes_attributes.values.each do |v|
            if !v["input_name"].empty? && !v["quantity"].empty?
                ingredient = Ingredient.find_or_create_by(name: v["input_name"].downcase)
                self.ingredients_recipes.build(ingredient_id: ingredient.id, recipe_id: self.id, input_name: v["input_name"], quantity: v["quantity"])
            end
        end
    end

    def by_pantry(pantry_id)
        pantry = Pantry.find(pantry_id)
        self.ingredients_recipes.each do |ingredient|
            if !pantry.ingredients.include?(Ingredient.find(ingredient["ingredient_id"]))
                return false
            end
        end
        return true
    end

    def self.all_by_pantry(pantry_id)
        all_recipes = []
        self.all.each do |recipe|
            if recipe.by_pantry(pantry_id)
                all_recipes << recipe
            end
        end
        all_recipes
    end

    def self.fastest
        order('prep_time').limit(5)
    end
end