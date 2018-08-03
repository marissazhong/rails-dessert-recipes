class ChangeUidToLargerLimit < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :uid
    add_column :users, :uid, :integer, limit: 8
  end
end
