class Post < ApplicationRecord

  has_one_attached :image
  has_rich_text :intr

  belongs_to :user
  has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :post_tags,dependent: :destroy
  has_many :tags,through: :post_tags

  # いいねについての記述
  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

  # タグについての記述
  def save_post(tags)
    # タグが存在していれば、タグの名前を配列として全て取得
    current_tags = self.tags.pluck(:name) unless self.tags.nil?
    # 現在取得したタグから送られてきたタグを除いてoldtagとする
    old_tags = current_tags - tags
    # 送信されてきたタグから現在存在するタグを除いたタグをnewとする
    new_tags = tags - current_tags

    # 古いタグを消す
    old_tags.each do |old|
      self.tags.delete Tag.find_by(name: old)
    end

    # 新しいタグを保存
    new_tags.each do |new|
      post_tag = Tag.find_or_create_by(name: new)
      self.tags << post_tag
    end
  end

  #　↓画像が無い場合は「no_image」の画像を使うようにする
  def get_image
    (image.attached?) ? image : 'no_image.jpg'
  end

  # 検索方法分岐
  def self.search(word)
    if word
      @post = Post.where("title LIKE?","%#{word}%")
    else
      @post = Post.all
    end
  end

end
