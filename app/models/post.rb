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

  default_scope -> { order(created_at: :desc) }
end
