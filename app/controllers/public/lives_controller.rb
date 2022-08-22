# frozen_string_literal: true

class Public::LivesController < ApplicationController
  def index
    @q = Live.ransack(params[:q])
    @lives = @q.result.order(live_date: "DESC").where(status: 1).page params[:page]
  end

  def show
    @live = Live.find(params[:id])
  end

  def new
    @live = Live.new
  end

  def create
    @live = Live.new(live_params)
    if @live.save
      flash[:success] = "投稿依頼完了しました"
      redirect_to customers_completion_path
    else
      flash.now[:danger] = "入力内容を確認してください"
      render :new
    end
  end

  private
    def live_params
      params.require(:live).permit(:live_image, :name, :introduction, :live_date, :open_time, :start_time, :advance_price, :today_price, :status)
    end
end
