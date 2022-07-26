# frozen_string_literal: true

class Public::FavoriteArtistsController < ApplicationController
  before_action :authenticate_customer!

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
