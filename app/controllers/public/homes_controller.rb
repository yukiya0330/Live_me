class Public::HomesController < ApplicationController
  def top
    @today_lives = Live.where(live_date: Date.current, status: 1)
    @new_lives = Live.all.order(created_at: "DESC").where(status: 1)
    @new_reports = Report.all.order(created_at: "DESC")
    @after_lives = Live.where("live_date >= ?", Date.today).where(status: 1)
  end
end
