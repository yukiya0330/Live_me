class Public::LiveHousesController < ApplicationController
  def index
    @live_houses = LiveHouse.where(status: 0).page params[:page]
  end

  def show
    @live_house = LiveHouse.find(params[:id])
  end
end
