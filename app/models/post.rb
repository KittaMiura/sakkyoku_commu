class Post < ApplicationRecord

  has_one_attached :image
  belongs_to :user
  has_many :post_tags,dependent: :destroy
  has_many :tags,through: :post_tags

  #　↓画像が無い場合は「no_image」の画像を使うようにする
  def get_image
    (image.attached?) ? image : 'no_image.jpg'
  end

end
