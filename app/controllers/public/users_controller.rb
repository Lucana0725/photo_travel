class Public::UsersController < ApplicationController
  def show
    @user = current_user
  end

  def edit
    @user = current_user
  end

  def update
    # byebug
    @user = current_user
    @user.update!(user_params)
    redirect_to mypage_path
  end

  def unsubscribe
    @user = current_user
  end

  def withdrawal
    # byebug
    @user = current_user
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
end