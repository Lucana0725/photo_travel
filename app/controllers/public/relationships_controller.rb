class Public::RelationshipsController < ApplicationController
  def create
    current_user.follow(params[:user_id])  # Userモデルのfollowメソッドを参照している
    redirect_to request.referer
  end

  def destroy
    current_user.unfollow(params[:user_id])  # Userモデルのunfollowメソッドを参照している
    redirect_to request.referer
  end

  def followings
    user = User.find(params[:user_id])
    @users = user.following_user  # Userモデルのhas_manyの:following_user
  end

  def followers
    user = User.find(params[:user_id])
    @users = user.follower_user  # Userモデルのhas_manyの:follower_user
  end
end
