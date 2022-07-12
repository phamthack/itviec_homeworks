class AddIndexInPosts < ActiveRecord::Migration[7.0]
  def up
    add_index :posts, :user_id
  end

  def down
    remove_index :posts, name: 'index_posts_on_user_id'
  end
end
