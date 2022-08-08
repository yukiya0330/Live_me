class Admin::HomesController < ApplicationController
  before_action :authenticate_admin!
  
  def top
    @artists = Artist.where(status: 0)
    @lives = Live.where(status: 0)
  end
end
