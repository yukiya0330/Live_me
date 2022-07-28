class Public::HomesController < ApplicationController
  def top
    @lives = Live.all
    @reports = Report.all
  end

  def about
  end
end
