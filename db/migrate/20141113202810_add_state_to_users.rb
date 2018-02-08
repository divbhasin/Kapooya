class AddStateToUsers < ActiveRecord::Migration
  def change
    add_column :users, :state, :integer
    add_index :users, :state
  end
end
