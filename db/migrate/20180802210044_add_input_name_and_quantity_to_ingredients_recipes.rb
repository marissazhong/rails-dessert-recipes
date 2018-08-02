class AddInputNameAndQuantityToIngredientsRecipes < ActiveRecord::Migration[5.1]
  def change
    add_column :ingredients_recipes, :input_name, :string
    add_column :ingredients_recipes, :quantity, :string
  end
end
