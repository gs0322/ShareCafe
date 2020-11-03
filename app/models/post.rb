class Post < ApplicationRecord
  validates :title, presence: true, length: { maximum: 30 }
  validates :text, presence: true, length: { maximum: 200 }
  validates :img, presence: { message: 'はjpg jpeg gif pngを投稿してください。' }
  validates :rate, presence: true
  validates :address, presence: true

  belongs_to :user
  has_many :favorites
  has_many :comments, dependent: :destroy

  mount_uploader :img, ImgUploader

  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

  has_many :hashtag_posts, dependent: :destroy
  has_many :hashtags, through: :hashtag_posts
  
  after_create do
    post = Post.find_by(id: id)
    hashtags = hashbody.scan(/[#＃][\w\p{Han}ぁ-ヶｦ-ﾟー]+/)
    hashtags.uniq.map do |hashtag|
      tag = Hashtag.find_or_create_by(hashname: hashtag.downcase.delete('#'))
      post.hashtags << tag
    end
  end
  
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
