class ChangeHashtagPostImagesToHashtagPosts < ActiveRecord::Migration[5.2]
  def change
    rename_table :hashtag_post_images, :hashtag_posts
  end
end
