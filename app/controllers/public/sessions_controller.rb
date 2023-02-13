# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]
  before_action :user_state, only: [:create]
  layout 'sessions'

  def after_sign_in_path_for(resource)
    travels_path
  end

  def after_sign_out_path_for(resource)
    root_path
  end

  # ゲストログイン用アクション
  def guest_sign_in  # User.rbにてユーザーデータを定義。そちらを使用。
    user = User.guest
    sign_in user
    redirect_to travels_path, notice: 'ゲストユーザーとしてログインしました。'
  end


  protected

  # ユーザーが退会しているかどうか判断するメソッド
  def user_state
    @user = User.find_by(email: params[:user][:email])  # 入力されたEmailアドレスからアカウントを1件取得
    return if !@user  # アカウントを取得できなかった場合、このメソッドを終了
    if @user.valid_password?(params[:user][:password]) && @user.is_deleted == true  # 上二つがtrueだったら新規登録画面へ遷移させる
      redirect_to new_user_registration_path
    end
  end

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
