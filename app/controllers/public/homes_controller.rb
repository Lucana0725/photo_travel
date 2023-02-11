class Public::HomesController < ApplicationController
  def top
    @travels = Travel.order('created_at DESC').limit(4)  # public/homes/top.html.backup.erb用
    render layout: 'top'  # views/layouts/top.html.erbを読み込む。
  end

  def about
    render layout: 'about'
  end
end
