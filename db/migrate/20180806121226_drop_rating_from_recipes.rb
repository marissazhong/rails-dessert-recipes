class DropRatingFromRecipes < ActiveRecord::Migration[5.1]
  def change
    remove_column :recipes, :rating
  end
end
