class Admin::LiveSchedulesController < ApplicationController
  def new
    @live = Live.find(params[:live_id])
  end
  
  def create
    @live_schedule = LiveSchedule.new(live_schedule_params)
    if @live_schedule.save
      @live = @live_schedule.live
      redirect_to admin_live_path(@live.id)
    else
      @live = Live.find(params[:live_id])
      render :new
    end  
  end
  
  def destroy
    @live_schedule = LiveSchedule.find_by(params[:id])
    @live_schedule.destroy
    redirect_to request.referer
  end
  
  private
  def live_schedule_params
    params.require(:live_schedule).permit(:live_house_id, :live_id)
  end
end
