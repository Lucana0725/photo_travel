class Admin::UsersController < ApplicationController
  before_action :move_to_signed_in
  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    # byebug
    @user = User.find(params[:id])
    @user.update!(user_params)
    redirect_to admin_user_path(@user)
  end


  private

  def user_params
    params.require(:user).permit(:is_deleted)
  end
end
