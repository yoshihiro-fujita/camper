class Post < ApplicationRecord
    belongs_to :user
    attachment :image
    has_many :favorites, dependent: :destroy
    has_many :hashtag_posts, dependent: :destroy
    has_many :hashtags, through: :hashtag_posts

    with_options presence: true do
        validates :title
        validates :body
        validates :image
    end
    geocoded_by :address
    after_validation :geocode, if: :address_changed?

    after_create do
        post = Post.find_by(id: id)
        # hashbodyに打ち込まれたハッシュタグを検出
        hashtags = hashbody.scan(/[#＃][\w\p{Han}ぁ-ヶｦ-ﾟー]+/)
        hashtags.uniq.map do |hashtag|
          # ハッシュタグは先頭の#を外した上で保存
          tag = Hashtag.find_or_create_by(hashname: hashtag.downcase.delete('#'))
          post.hashtags << tag
        end
      end
      #更新アクション
      before_update do
        post = Post.find_by(id: id)
        post.hashtags.clear
        hashtags = hashbody.scan(/[#＃][\w\p{Han}ぁ-ヶｦ-ﾟー]+/)
        hashtags.uniq.map do |hashtag|
          tag = Hashtag.find_or_create_by(hashname: hashtag.downcase.delete('#'))
          post.hashtags << tag
        end
      end
end
