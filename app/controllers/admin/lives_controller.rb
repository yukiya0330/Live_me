class Admin::LivesController < ApplicationController
  def index
    @lives = Live.all
  end

  def show
    @live = Live.find(params[:id])
    @performing_artists = @live.performing_artists
  end

  def new
    @live = Live.new
  end

  def edit
    @live = Live.find(params[:id])
  end
  
  def create
    @live = Live.new(live_params)
    if @live.save
      redirect_to admin_live_path(@live)
    else
      render :new
    end  
  end
  
  def update
    @live = Live.find(params[:id])
    if @live.update(live_params)
      redirect_to admin_live_path(@live)
    else
      render :edit
    end  
  end
  
  private
  def live_params
    params.require(:live).permit(:live_image, :name, :introduction, :live_date, :open_time, :start_time, :advance_price, :today_price, :status)
  end
end
