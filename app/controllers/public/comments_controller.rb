class Public::CommentsController < ApplicationController
  def create
    travel = Travel.find(params[:travel_id])  # コメントを作成する投稿を探す
    comment = current_user.comments.new(comment_params)  # ログインユーザーで投稿を作成
    comment.travel_id = travel.id  # コメントが紐づくtravel_id(FK)は投稿のid(travel.id)に一致しなければならない
    comment.save
    redirect_to travel_path(travel)
  end
  
  def destroy
    # travel = Travel.find(params[:travel_id])
    # comment = current_user.comments.find_by(travel_id: travel.id)
    Comment.find_by(id: params[:id], travel_id: params[:travel_id]).destroy  # コメントのidや投稿idからコメントを探し出し、コメントを削除
    redirect_to travel_path(params[:travel_id])  # その投稿詳細画面に戻る
  end
  
  
  protected
  
  def comment_params
    params.require(:comment).permit(:comment_body)
  end
end
