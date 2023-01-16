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
  end

  def withdrawal
  end
  
  
  private
  
  def user_params
    params.require(:user).permit([:profile_image, :nickname, :introduction])
  end
end
