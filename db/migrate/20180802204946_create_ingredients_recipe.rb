class CreateIngredientsRecipe < ActiveRecord::Migration[5.1]
  def change
    create_join_table :ingredients, :recipes do |t|
      t.index :ingredient_id
      t.index :recipe_id
    end
  end
end
