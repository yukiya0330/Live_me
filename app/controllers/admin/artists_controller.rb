class Admin::ArtistsController < ApplicationController
  def index
    @artists = Artist.all
  end

  def show
    @artist = Artist.find(params[:id])
    @artist_genres = @artist.artist_genres
  end

  def edit
    @artist = Artist.find(params[:id])
  end
  
  def new
    @artist = Artist.new
  end
  
  def create
    @artist = Artist.new(artist_params)
    if @artist.save
      redirect_to admin_artist_path(@artist), notice: "登録に成功しました"
    else
      render :new
    end  
  end
  
  def update
    @artist = Artist.find(params[:id])
    if @artist.update(artist_params)
      redirect_to admin_artist_path(@artist)
    else
      render :edit
    end  
  end
  
  private
  def artist_params
    params.require(:artist).permit(:artist_image, :name, :introduction, :official_url, :status)
  end
end
