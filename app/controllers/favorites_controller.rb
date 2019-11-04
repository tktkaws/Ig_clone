class FavoritesController < ApplicationController
  def create
    favorite = current_user.favorites.create(picture_id: params[:picture_id])
    redirect_to pictures_url, success: "#{favorite.picture.user.name}さんの投稿をお気に入りに登録しました"
  end

  def destroy
    favorite = current_user.favorites.find_by(id: params[:id]).destroy
    redirect_to pictures_url, danger: "#{favorite.picture.user.name}さんの投稿をお気に入りから解除しました"
  end
end
