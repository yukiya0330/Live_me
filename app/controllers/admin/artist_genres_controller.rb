class Admin::ArtistGenresController < ApplicationController
  def new
    @genres = Genre.all
    @artist_genre = ArtistGenre.new
    @artist = Artist.find(params[:artist_id])
  end
  
  def create
    @artist_genre = ArtistGenre.new(artist_genre_params)
    if @artist_genre.save
      @artist = @artist_genre.artist
      redirect_to admin_artist_path(@artist.id)
    else
      @artist = Artist.find(params[:artist_id])
      render :new
    end  
  end
  
  def destroy
    @artist_genre = ArtistGenre.find_by(params[:id])
    # @artist = Artist.find(params[:artist_id])
    # @artist_genre = @artist.artist_genres.find_by(artist_id: @artist.id)
    @artist_genre.destroy
    redirect_to request.referer
  end
  
  private
  def artist_genre_params
    params.require(:artist_genre).permit(:artist_id, :genre_id)
  end
end
