class Admin::LiveHousesController < ApplicationController
  def index
    @live_houses = LiveHouse.all
  end

  def show
    @live_house = LiveHouse.find(params[:id])
  end

  def edit
    @live_house = LiveHouse.find(params[:id])
  end

  def new
    @live_house = LiveHouse.new
  end
  
  def create
    @live_house = LiveHouse.new(live_house_params)
    if @live_house.save
      redirect_to admin_live_house_path(@live_house)
    else
      render :new
    end  
  end
  
  def update
    @live_house = LiveHouse.find(params[:id])
    if @live_house.update(live_house_params)
      redirect_to admin_live_house_path(@live_house)
    else
      render :edit
    end  
  end
  
  private
  def live_house_params
    params.require(:live_house).permit(:name, :introduction, :postal_code, :address, :official_url, :status)
  end
end
