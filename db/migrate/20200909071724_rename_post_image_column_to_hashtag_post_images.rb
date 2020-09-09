class RenamePostImageColumnToHashtagPostImages < ActiveRecord::Migration[5.2]
  def change
    rename_column :hashtag_post_images, :post_image_id, :post_id
  end
end
