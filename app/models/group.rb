class Group < ApplicationRecord

  has_many :group_users
  # グループは複数のユーザーを持つ。group_usersから参照可能
  has_many :users, through: :group_users, dependent: :destroy
  # グループオーナー表示のために
  belongs_to :user

  has_one_attached :group_image

  def get_group_image
    (group_image.attached?) ? group_image : 'no_image.jpg'
  end

  validates :name, presence: true
  validates :introduction, presence: true

end
