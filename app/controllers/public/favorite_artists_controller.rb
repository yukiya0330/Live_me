class Public::FavoriteArtistsController < ApplicationController
  def create
    artist = Artist.find(params[:artist_id])
    favorite_artist = current_customer.favorite_artists.new(artist_id: artist.id)
    favorite_artist.save
    redirect_to request.referer
  end
  
  def destroy
    artist = Artist.find(params[:artist_id])
    favorite_artist = current_customer.favorite_artists.find_by(artist_id: artist.id)
    favorite_artist.destroy
    redirect_to request.referer
  end
end
