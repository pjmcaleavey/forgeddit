class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.integer :user_id
      t.string :title
      t.string :link_url
      t.string :timestamp

      t.timestamps null: false
    end
  end
end
