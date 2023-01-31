class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  # アソシエーション
  has_many :travels, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :comments, dependent: :destroy
  
  # フォロー機能のアソシエーション
  # フォローした、されたの関係
  has_many :follower, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy  # フォローしている人の取得（Userのfollowerから見た関係）
  has_many :followed, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy  # フォローされている人の取得（Userのfollowedから見た関係）
  
  # フォロー一覧やフォロワー一覧でユーザーを取得、表示するためのアソシエーション
  has_many :following_user, through: :follower, source: :followed  # 自分がフォローしている人
  has_many :follower_user, through: :followed, source: :follower  # 自分をフォローしている人（自分がフォローされている人）
  
  
  
  # フォローしたときの処理
  def follow(user_id)
    follower.create(followed_id: user_id)
  end
  
  # フォローを外すときの処理
  def unfollow(user_id)
    follower.find_by(followed_id: user_id).destroy
  end
  
  # フォローしているかの判定
  def following?(user)
    following_user.include?(user)
  end
  
  
  # ゲストログイン用ユーザーデータ(public/sessions#guest_sign_inにて使用)
  def self.guest  # クラスメソッド。
    find_or_create_by(email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      user.nickname = 'ゲスト'
      user.last_name = 'ゲスト'
      user.first_name = '太郎'
      user.last_name_kana = 'ゲスト'
      user.first_name_kana = 'タロウ'
    end
  end
  
  
  
  
  # プロフィール画像を:profile_imageにて保持
  has_one_attached :profile_image
  
  # プロフィール画像の取得
  def get_profile_image(width, height)
    unless profile_image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      profile_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    profile_image.variant(resize_to_limit: [width, height]).processed
  end
end
