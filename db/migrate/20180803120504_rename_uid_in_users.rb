class RenameUidInUsers < ActiveRecord::Migration[5.1]
  def change
    rename_column :users, :uid, :fb_uid
  end
end
