# frozen_string_literal: true

class Admin::LiveHousesController < ApplicationController
  before_action :authenticate_admin!

  def index
    @q = LiveHouse.ransack(params[:q])
    @live_houses = @q.result.page params[:page]
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
      flash[:success] = "登録されました"
      redirect_to admin_live_house_path(@live_house)
    else
      flash.now[:danger] = "入力内容を確認してください"
      render :new
    end
  end

  def update
    @live_house = LiveHouse.find(params[:id])
    if @live_house.update(live_house_params)
      flash[:success] = "編集内容が保存されました"
      redirect_to admin_live_house_path(@live_house)
    else
      flash.now[:danger] = "編集内容を確認してください"
      render :edit
    end
  end

  def destroy
    @live_house = LiveHouse.find(params[:id])
    @live_house.destroy
    flash.now[:danger] = "1件の登録が削除されました"
    redirect_to admin_lives_house_path
  end

  private
    def live_house_params
      params.require(:live_house).permit(:name, :introduction, :postal_code, :address, :official_url, :status, :house_image, :latitude, :longitude)
    end
end
