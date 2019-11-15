class FavoritesController < ApplicationController
  def index
    @favorites = current_user.favorites
  end

  def create
    favorite = current_user.favorites.create(post_id: params[:post_id])
    redirect_to posts_path, notice: "#{favorite.post.user.user_name}さんの投稿をお気に入り登録しました"
  end

  def destroy
    favorite = current_user.favorites.find_by(id: params[:id]).destroy
    redirect_to posts_path, notice: "#{favorite.post.user.user_name}さんの投稿をお気に入り削除しました"
  end
end
