class Public::GenresController < ApplicationController
  def index
    @genres = Genre.all
    # 全てのジャンルから自分のお気に入りジャンルを取得
    @my_artist_genres = ArtistGenre.where(genre_id: current_customer.genres.ids).select(:artist_id).distinct
  end
end
