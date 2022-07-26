# frozen_string_literal: true

class Public::ReportsController < ApplicationController
  before_action :ensure_current_customer, only: [:edit, :update, :destroy]

  def index
    @q = Report.ransack(params[:q])
    @reports = @q.result.order(created_at: "DESC").page params[:page]
    if params[:customer_id].present?
      @customer = Customer.find(params[:customer_id])
      @reports = @customer.reports.page params[:page]
    end
  end

  def show
    @report = Report.find(params[:id])
  end

  def new
    @report = Report.new
    @live = Live.find(params[:live_id])
  end

  def edit
    @report = Report.find(params[:id])
  end

  def create
    @report = Report.new(report_params)
    @report.customer_id = current_customer.id
    if @report.save
      flash[:success] = "投稿されました"
      redirect_to report_path(@report)
    else
      flash[:danger] = "投稿に失敗しました"
      @live = Live.find_by(id: params[:live_id])
      render :new
    end
  end

  def update
    @report = Report.find(params[:id])
    if @report.update(report_params)
      flash[:success] = "編集内容が保存されました"
      redirect_to report_path(@report)
      logger.debug @report.errors.inspect
    else
      flash.now[:danger] = "編集内容を確認してください"
      render :edit
    end
  end

  def destroy
    @report = Report.find(params[:id])
    @report.destroy
    flash[:warning] = "一件のレポートが削除されました"
    redirect_to reports_path
  end
  
  def ensure_current_customer
  	@report = Report.find(params[:id])
  	if @report.customer_id != current_customer.id
  		flash[:notice] = "権限がありません"
  		redirect_to reports_path
  	end
  end

  private
    def report_params
      params.require(:report).permit(:report_image, :comment, :customer_id, :live_id)
    end
end
