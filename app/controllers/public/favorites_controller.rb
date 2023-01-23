class Public::FavoritesController < ApplicationController
  def create
    travel = Travel.find(params[:travel_id])
    favorite = current_user.favorites.new(travel_id: travel.id)
    favorite.save
    redirect_to travel_path(travel)
  end
  
  def destroy
    
  end
end
