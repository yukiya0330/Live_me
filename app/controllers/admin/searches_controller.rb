class Admin::SearchesController < ApplicationController
  before_action :authenticate_admin!
	
	def search
	  @model = params[:model]
	  @content = params[:content]
	  @method = params[:method]
	  if @model == 'artist'
	    @records = Artist.search_for(@content, @method).page params[:page]
	  elsif @model == 'live'
		  @records = Live.search_for(@content, @method).page params[:page]
	  elsif @model == 'live_house'
		  @records = LiveHouse.search_for(@content, @method).page params[:page]
	  else
		  @records = Customer.search_for(@content, @method).page params[:page]
	  end
	end
end
