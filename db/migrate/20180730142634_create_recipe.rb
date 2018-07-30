class CreateRecipe < ActiveRecord::Migration[5.1]
  def change
    create_table :recipes do |t|
      t.string :name
      t.decimal :rating
      t.text :instructions
      t.timestamps
    end
  end
end
