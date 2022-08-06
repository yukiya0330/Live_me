class Public::SearchesController < ApplicationController

	def search
	  @model = params[:model]
	  @content = params[:content]
	  @method = params[:method]
	  if @model == 'artist'
	    @records = Artist.search_for(@content, @method)
	  elsif @model == 'live'
		  @records = Live.search_for(@content, @method)
		else
		  @records = LiveHouse.search_for(@content, @method)
	  end
	end
end