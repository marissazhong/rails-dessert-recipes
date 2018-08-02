class DropRecipeIngredients < ActiveRecord::Migration[5.1]
  def change
    drop_table :recipe_ingredients
  end
end
