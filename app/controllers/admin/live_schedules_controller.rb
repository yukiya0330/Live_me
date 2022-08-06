class Admin::LiveSchedulesController < ApplicationController
  def new
    @live = Live.find(params[:live_id])
  end
  
  def create
    @live_schedule = LiveSchedule.new(live_schedule_params)
    if @live_schedule.save
      @live = @live_schedule.live
      flash[:success] = "ライブハウスが追加されました"
      redirect_to request.referer
    else
      redirect_to request.referer
    end  
  end
  
  def destroy
    @live_schedule = LiveSchedule.find(params[:id])
    @live_schedule.destroy
    flash[:success] = "一件のライブハウスが削除されました"
    redirect_to request.referer
  end
  
  private
  def live_schedule_params
    params.require(:live_schedule).permit(:live_house_id, :live_id)
  end
end
