class AddTimeToRecipe < ActiveRecord::Migration[5.1]
  def change
    add_column :recipes, :prep_time, :integer
    add_column :recipes, :cook_time, :integer
  end
end
