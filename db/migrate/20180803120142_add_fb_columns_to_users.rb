class AddFbColumnsToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :fb_name, :string
    add_column :users, :fb_email, :string
    add_column :users, :fb_image, :string
  end
end
