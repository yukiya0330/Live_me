class Public::ArtistsController < ApplicationController
  def index
    @q = Artist.ransack(params[:q])
    @artists = @q.result.where(status: 1).page params[:page]
  end

  def show
    @artist = Artist.find(params[:id])
    @comments = Comment.all.order(id: "DESC")
  end
  
  def new
    @artist = Artist.new
  end
  
  def create
    @artist = Artist.new(artist_params)
    if @artist.save
      flash[:success] = "投稿依頼完了しました"
      redirect_to customers_completion_path
    else
      flash[:danger] = "入力内容を確認してください"
      render :new
    end
  end
  
  private
    def artist_params
      params.require(:artist).permit(:artist_image, :name, :introduction, :official_url)
    end
end
