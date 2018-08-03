class CreatePantry < ActiveRecord::Migration[5.1]
  def change
    create_table :pantries do |t|
      t.integer :user_id
    end
  end
end
