class Public::ReportsController < ApplicationController
  def index
    @reports = Report.all
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
      redirect_to customer_path(current_customer)
    else
      @live = @report.live
      render :new
    end  
  end
  
  def update
    @report = Report.find(params[:id])
    if @report.update(report_params)
      redirect_to customer_path(current_customer)
    else
      render :edit
    end  
  end
  
  private
  def report_params
    params.require(:report).permit(:report_image, :comment, :customer_id, :live_id)
  end
end
