# frozen_string_literal: true

class Admin::ReportsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @customer = Customer.find(params[:customer_id])
    @reports = @customer.reports.order(created_at: "DESC")
  end

  def show
    @report = Report.find(params[:id])
  end

  def destroy
    @report = Report.find(params[:id])
    @report.destroy
    flash[:notice] = "一件のコメントが削除されました"
    redirect_to admin_reports_path(customer_id: @report.customer.id)
  end
end
