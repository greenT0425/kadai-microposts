class FavoriteRelationshipsController < ApplicationController
  before_action :require_user_logged_in
  
  def create
    micropost = Micropost.find(params[:micropost_id])
    current_user.do_favorite(micropost)
    flash[:success] = 'メッセージをお気に入りに追加しました。'
    redirect_to :back
  end

  def destroy
    micropost = Micropost.find(params[:micropost_id])
    current_user.undo_favorite(micropost)
    flash[:success] = 'メッセージをお気に入りから削除しました。'
    redirect_to :back
  end
end
