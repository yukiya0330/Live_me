# frozen_string_literal: true

class Public::GenresController < ApplicationController
  def index
    @genres = Genre.all
  end
end
