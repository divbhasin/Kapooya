class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :comment
      t.datetime :commented_at

      t.timestamps
    end
  end
end
