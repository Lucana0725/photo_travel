class Travel < ApplicationRecord
  # アソシエーション
  belongs_to :user

  has_many :favorites, dependent: :destroy
  has_many :comments, dependent: :destroy

  geocoded_by :address
  after_validation :geocode

  # 引数で渡されるuser_idを使って、そのユーザーidがFavoritesテーブル内に存在するかどうかを調べる
  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end


  # 投稿画像を:imageで保持
  has_one_attached :image

  # 投稿画像の取得
  def get_image(width, height)
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image.variant(resize_to_limit: [width, height]).processed
  end
end
