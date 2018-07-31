class ChangeInstructionsColumnToDirections < ActiveRecord::Migration[5.1]
  def change
    rename_column :recipes, :instructions, :directions
  end
end
