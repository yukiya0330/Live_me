# frozen_string_literal: true

class Public::HomesController < ApplicationController
  def top
    @reports = Report.all
    @today_lives = Live.where(live_date: Date.current, status: 1)
    @new_lives = Live.all.order(created_at: "DESC").where(status: 1)
    @new_reports = Report.all.order(created_at: "DESC")
  end
end
