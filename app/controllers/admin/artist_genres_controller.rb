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
    @genre = Genre.find(params[:genre_id])
    @artist_genre = ArtistGenre.find_by(genre_id: @genre.id)
    @artist_genre.destroy
    redirect_to request.referer
  end
  
  private
  def artist_genre_params
    params.require(:artist_genre).permit(:artist_id, :genre_id)
  end
end
