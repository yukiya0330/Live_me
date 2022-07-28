class Admin::ArtistGenresController < ApplicationController
  def new
    @genres = Genre.all
    @artist_genre = ArtistGenre.new
    @artist = Artist.find(params[:artist_id])
  end
  
  def create
    @artist_genre = ArtistGenre.new(artist_genre_params)
    if @artist_genre.save
      redirect_to admin_artist_path(@artist_genre.id)
    else
      @artist = Artist.find(params[:artist_id])
      render :new
    end  
  end
  
  private
  def artist_genre_params
    params.require(:artist_genre).permit(:artist_id, :genre_id)
  end
end
