class CreateJoinTablePantryIngredients < ActiveRecord::Migration[5.1]
  def change
    create_join_table :pantries, :ingredients
  end
end
