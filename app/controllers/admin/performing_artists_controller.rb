class Admin::PerformingArtistsController < ApplicationController
  def new
    @live = Live.find(params[:live_id])
  end
  
  def create
    @performing_artist = PerformingArtist.new(performing_artist_params)
    if @performing_artist.save
      @live = @performing_artist.live
      redirect_to request.referer
    else
      redirect_to request.referer
    end  
  end
  
  def destroy
    @performing_artist = PerformingArtist.find(params[:id])
    @performing_artist.destroy
    redirect_to request.referer
  end
  
  private
  def performing_artist_params
    params.require(:performing_artist).permit(:artist_id, :live_id)
  end
end
