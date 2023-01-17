class Public::TravelsController < ApplicationController
  def new
    @travel = Travel.new
  end

  def create
    # byebug
    @user = current_user  # ユーザー情報の保持
    @travel = Travel.new(travel_params)
    @travel.user_id = current_user.id  # アソシエーションの関係で@travelにはユーザーが必要なので
    @travel.save!
    redirect_to travels_path
  end

  def index
    @travels = Travel.all
    # @travel = @travels.find(params[:id])
    # @user = User.find(params[:id])
    # @user = User.find(params[:id])
    @user = current_user
    user_id = @user.id
  end

  def show
  end

  def destroy
  end

  
  protected
  
  def travel_params
    params.require(:travel).permit(:user_id, :image, :title, :body)
  end

end
