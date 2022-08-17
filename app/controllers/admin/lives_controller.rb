# frozen_string_literal: true

class Admin::LivesController < ApplicationController
  before_action :authenticate_admin!

  def index
    @q = Live.ransack(params[:q])
    @lives = @q.result.page params[:page]
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
      flash[:success] = "登録されました"
      redirect_to admin_live_path(@live)
    else
      flash.now[:danger] = "入力内容を確認してください"
      render :new
    end
  end

  def update
    @live = Live.find(params[:id])
    if @live.update(live_params)
      flash[:success] = "編集内容が保存されました"
      redirect_to admin_live_path(@live)
    else
      flash.now[:danger] = "編集内容を確認してください"
      render :edit
    end
  end

  def destroy
    @live = Live.find(params[:id])
    @live.destroy
    flash.now[:danger] = "1件の登録が削除されました"
    redirect_to admin_lives_path
  end

  private
    def live_params
      params.require(:live).permit(:live_image, :name, :introduction, :live_date, :open_time, :start_time, :advance_price, :today_price, :status)
    end
end
