# frozen_string_literal: true

class Admin::ArtistGenresController < ApplicationController
  before_action :authenticate_admin!

  def create
    @artist_genre = ArtistGenre.new(artist_genre_params)
    if @artist_genre.save
      flash[:success] = "ジャンルが追加されました"
      @artist = @artist_genre.artist
      redirect_to request.referer
    else
      flash[:danger] = "正常に保存できませんでした"
      redirect_to request.referer
    end
  end

  def destroy
    @genre = Genre.find(params[:genre_id])
    @artist_genre = ArtistGenre.find_by(genre_id: @genre.id)
    @artist_genre.destroy
    flash[:success] = "一件のジャンルが削除されました"
    redirect_to request.referer
  end

  private
    def artist_genre_params
      params.require(:artist_genre).permit(:artist_id, :genre_id)
    end
end
