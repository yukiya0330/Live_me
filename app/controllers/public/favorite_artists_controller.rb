class Public::FavoriteArtistsController < ApplicationController
  def create
    @artist = Artist.find(params[:artist_id])
    favorite_artist = current_customer.favorite_artists.new(artist_id: @artist.id)
    favorite_artist.save
  end
  
  def destroy
    @artist = Artist.find(params[:artist_id])
    favorite_artist = current_customer.favorite_artists.find_by(artist_id: @artist.id)
    favorite_artist.destroy
  end
end
