class Public::FavoritesController < ApplicationController
  def create
    travel = Travel.find(params[:travel_id])  # travel_idで投稿(travel)をfind、travelにて格納
    favorite = current_user.favorites.new(travel_id: travel.id)  # = 「favorite = Favorite.new、 favorite.user_id = current_user.id」
    favorite.save
    redirect_to travel_path(travel)
  end
  
  def destroy
    travel = Travel.find(params[:travel_id])
    favorite = current_user.favorites.find_by(travel_id: travel.id)
    favorite.destroy
    redirect_to travel_path(travel)
  end
end
