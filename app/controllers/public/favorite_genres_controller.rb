class Public::FavoriteGenresController < ApplicationController
  before_action :authenticate_customer!
  
  def create
    genre = Genre.find(params[:genre_id])
    favorite_genre = current_customer.favorite_genres.new(genre_id: genre.id)
    favorite_genre.save
    redirect_to request.referer
  end
  
  def destroy
    genre = Genre.find(params[:genre_id])
    favorite_genre = current_customer.favorite_genres.find_by(genre_id: genre.id)
    favorite_genre.destroy
    redirect_to request.referer
  end
end
