class Public::BookmarkLivesController < ApplicationController
  def create
    live = Live.find(params[:live_id])
    bookmark_live = current_customer.bookmark_lives.new(live_id: live.id)
    bookmark_live.save
    redirect_to request.referer
  end
  
  def destroy
    live = Live.find(params[:live_id])
    bookmark_live = current_customer.bookmark_lives.find_by(live_id: live.id)
    bookmark_live.destroy
    redirect_to request.referer
  end
end