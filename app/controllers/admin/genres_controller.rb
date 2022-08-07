class Admin::GenresController < ApplicationController
  
  def index
    @genres = Genre.all
    @genre = Genre.new
  end
  
  def create
    @genre = Genre.new(genre_params)
    if @genre.save
      flash[:success] = "登録されました"
      redirect_to request.referer
    else
      @genres = Genre.all
      flash.now[:danger] = "編集内容を確認してください"
      render :index
    end
  end
  
  def edit
    @genre = Genre.find(params[:id])  
  end
  
  def update
    @genre = Genre.find(params[:id])
    if @genre.update(genre_params)
      flash[:success] = "編集内容が保存されました"
      redirect_to admin_genres_path
    else
      flash.now[:danger] = "編集内容を確認してください"
      render :edit
    end
  end
  
  def destroy
    @genre = Genre.find(params[:id])
    @genre.destroy
    flash[:success] = "１件のジャンルが削除されました"
    redirect_to admin_genres_path
  end
  
  private
  def genre_params
    params.require(:genre).permit(:name)
  end
end
