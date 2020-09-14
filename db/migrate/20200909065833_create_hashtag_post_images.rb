class CreateHashtagPostImages < ActiveRecord::Migration[5.2]
  def change
    create_table :hashtag_posts do |t|
      t.references :post_id, foreign_key: true
      t.references :hashtag, foreign_key: true

      t.timestamps
    end
  end
end
