# frozen_string_literal: true

class Admin::ReportsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @q = Report.ransack(params[:q])
    @reports = @q.result.page params[:page]
    if params[:customer_id].present?
      @customer = Customer.find(params[:customer_id])
      @reports = @customer.reports.page params[:page]
    end
  end

  def show
    @report = Report.find(params[:id])
  end

  def destroy
    @report = Report.find(params[:id])
    @report.destroy
    flash[:warning] = "一件のコメントが削除されました"
    redirect_to admin_reports_path(customer_id: @report.customer.id)
  end
end
