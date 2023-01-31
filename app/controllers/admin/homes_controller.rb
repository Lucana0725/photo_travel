class Admin::HomesController < ApplicationController
  def top
    @users = User.all  # 全登録ユーザーを取得
  end
end
