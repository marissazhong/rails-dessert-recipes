class RenameGoogleColumns < ActiveRecord::Migration[5.1]
  def change
    rename_column :users, :google_uid, :uid
    rename_column :users, :google_name, :name
    rename_column :users, :google_image_url, :image_url
  end
end
