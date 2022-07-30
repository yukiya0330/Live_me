class Public::ReportsController < ApplicationController
  def index
    @reports = Report.all
  end

  def show
    @report = Report.find(params[:id])
  end

  def new
    @report = Report.new
  end
  
  def create
    @report = Report.new(report_params)
    @report.customer_id = current_customer.id
    if @report.save
      redirect_to customer_path(current_customer)
    else
      render :new
      logger.debug @report.errors.inspect
    end  
  end
  
  private
  def report_params
    params.require(:report).permit(:report_image, :comment, :customer_id, :live_id)
  end
end
