class AddCommentingToComments < ActiveRecord::Migration
  def change
    add_column :comments, :commenting, :string
  end
end
