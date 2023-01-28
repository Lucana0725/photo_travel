class Public::TravelsController < ApplicationController
  def new
    @travel = Travel.new
  end

  def create
    # byebug
    @user = current_user  # ユーザー情報の保持
    @travel = Travel.new(travel_params)
    @travel.user_id = current_user.id  # アソシエーションの関係で@travelにはユーザーが必要なので
    if @travel.save!
      redirect_to travels_path
    else
      redirect_to new_travel_path
    end
  end

  def index
    # @travels = Travel.all
    @travels = Travel.order('created_at DESC')  # 投稿を新しい順に並べる
  end

  def show
    @travel = Travel.find(params[:id])
    @lat = @travel.latitude
    @lng = @travel.longitude
    gon.lat = @lat
    gon.lng = @lng
    
    @comment = Comment.new  # コメント新規作成用
    @comments = @travel.comments  # 紐づくコメントを全て表示する用
  end

  def destroy
    @travel = Travel.find(params[:id])
    @travel.destroy
    redirect_to travels_path
  end

  
  protected
  
  def travel_params
    params.require(:travel).permit(:user_id, :image, :title, :body, :latitude, :longitude)
  end

end
