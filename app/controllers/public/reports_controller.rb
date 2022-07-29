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
    if @report.save
      redirect_to report_path
    else
      render :new
    end  
  end
  
  private
  def report_params
    params.require(:report).permit(:report_image, :comment)
  end
end
