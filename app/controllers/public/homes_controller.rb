class Public::HomesController < ApplicationController
  def top
    @today_lives = Live.where(live_date: Date.current)
    @new_lives = Live.all.order(created_at: "DESC")
    @new_reports = Report.all.order(created_at: "DESC")
    @after_lives = Live.where("live_date >= ?", Date.today)
  end

  def about
  end
end
