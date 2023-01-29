class Public::HomesController < ApplicationController
  def top
    @travels = Travel.order('created_at DESC').limit(4)
  end

  def about
  end
end
