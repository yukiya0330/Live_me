# frozen_string_literal: true

class Admin::PerformingArtistsController < ApplicationController
  before_action :authenticate_admin!

  def create
    @performing_artist = PerformingArtist.new(performing_artist_params)
    if @performing_artist.save
      @live = @performing_artist.live
      flash[:success] = "アーティストが追加されました"
      redirect_to request.referer
    else
      redirect_to request.referer
    end
  end

  def destroy
    @performing_artist = PerformingArtist.find(params[:id])
    @performing_artist.destroy
    flash[:success] = "一件のアーティストが削除されました"
    redirect_to request.referer
  end

  private
    def performing_artist_params
      params.require(:performing_artist).permit(:artist_id, :live_id)
    end
end
