class Public::HomesController < ApplicationController
  def top
    @travels = Travel.order('created_at DESC').limit(4)
  end

  def about
  end
  
  def guest_sign_in
    user = User.find_or_create_by(email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      user.nickname = 'ゲスト'
      user.last_name = 'ゲスト'
      user.first_name = '太郎'
      user.last_name_kana = 'ゲスト'
      user.first_name_kana = 'タロウ'
    end
    sign_in user
    redirect_to root_path, notice: 'ゲストユーザーとしてログインしました。'
  end
end
