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
      flash[:success] = "登録されました"
      redirect_to admin_artist_path(@artist), notice: "登録に成功しました"
    else
      flash.now[:danger] = "入力内容を確認してください"
      render :new
    end  
  end
  
  def update
    @artist = Artist.find(params[:id])
    if @artist.update(artist_params)
      flash[:success] = "編集内容が保存されました"
      redirect_to admin_artist_path(@artist)
    else
      flash.now[:danger] = "編集内容を確認してください"
      render :edit
    end  
  end
  
  def destroy
    @artist = Artist.find(params[:id])
    @artist.destroy
    flash.now[:danger] = "1件の登録が削除されました"
    redirect_to admin_artists_path
  end
  
  private
  def artist_params
    params.require(:artist).permit(:artist_image, :name, :introduction, :official_url, :status)
  end
end
