class Post < ApplicationRecord

    

    validates :title, presence: true, length: { maximum: 30 }
    validates :text, presence: true, length: { maximum: 200 }
    validates :img, presence: true

    belongs_to :user
    mount_uploader :img, ImgUploader
end
