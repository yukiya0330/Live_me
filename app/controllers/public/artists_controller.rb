class Public::ArtistsController < ApplicationController
  def index
    @artists = Artist.all
  end

  def show
    @artist = Artist.find(params[:id])
    @comments = Comment.all
  end
  
  def new
    @artist = Artist.new
  end
  
  def create
    @artist = Artist.new(artist_params)
    if @artist.save
      redirect_to custmers_completion_path
    else
      render :new
    end  
  end
  
  private
  def artist_params
    params.require(:artist).permit(:artist_image, :name, :introduction, :official_url)
  end
end
