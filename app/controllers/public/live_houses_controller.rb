class Public::LiveHousesController < ApplicationController
  def index
    @q = LiveHouse.ransack(params[:q])
    @live_houses = @q.result.where(status: 0).page params[:page]
  end

  def show
    @live_house = LiveHouse.find(params[:id])
  end
end
