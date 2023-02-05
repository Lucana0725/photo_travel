class Public::HomesController < ApplicationController
  def top
    @travels = Travel.order('created_at DESC').limit(4)  # public/homes/top.html.backup.erb用
  end

  def about
  end
end
