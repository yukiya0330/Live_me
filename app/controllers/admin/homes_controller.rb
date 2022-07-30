class Admin::HomesController < ApplicationController
  def top
    @artists = Artist.where(status: 0)
    @lives = Live.where(status: 0)
  end
end
