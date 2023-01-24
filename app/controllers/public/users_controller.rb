class Public::UsersController < ApplicationController
  before_action :is_matching_login_user, only: [:edit, :update]
  
  def show
    @user = User.find(params[:id])
    @travels = @user.travels  # users#showでユーザー毎の全ての投稿を表示
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    # byebug
    @user = User.find(params[:id])
    @user.update!(user_params)
    redirect_to user_path
  end

  def unsubscribe
    @user = current_user
  end

  def withdrawal
    # byebug
    @user = User.find(params[:id])
    # @user.is_deleted = true
    # @user.save
    # redirect_to root_path
    @user.update(is_deleted: true)
    reset_session
    redirect_to root_path
  end
  
  
  private
  
  def user_params
    params.require(:user).permit([:profile_image, :nickname, :introduction])
  end
  
  
  # 他人のプロフィールを変更できないようにするバリデーション
  def is_matching_login_user
    user_id = params[:id].to_i
    unless user_id == current_user.id
      redirect_to travels_path
    end
  end
end
