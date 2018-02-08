class AddUsersAndPostsToComments < ActiveRecord::Migration
  def change
    add_column :comments, :user_id, :integer
    add_index :comments, :user_id
    add_column :comments, :micropost_id, :integer
    add_index :comments, :micropost_id
  end
end
