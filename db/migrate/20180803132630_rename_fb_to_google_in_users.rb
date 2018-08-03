class RenameFbToGoogleInUsers < ActiveRecord::Migration[5.1]
  def change
    rename_column :users, :fb_uid, :google_uid
    rename_column :users, :fb_name, :google_name
    remove_column :users, :fb_email
    rename_column :users, :fb_image, :google_image_url
  end
end
