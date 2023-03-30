class Admin::HomesController < ApplicationController
  before_action :move_to_signed_in
  def top
    @users = User.all  # 全登録ユーザーを取得
  end
end
