class Post < ApplicationRecord

    

    validates :title, presence: true, length: { maximum: 30 }
    validates :text, presence: true, length: { maximum: 200 }
    validates :img, presence: { message: 'はjpg jpeg gif pngを投稿してください。' }
    validates :rate, presence: true

    belongs_to :user
    mount_uploader :img, ImgUploader
end
