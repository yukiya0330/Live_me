class Public::CustomersController < ApplicationController
  def show
    @customer = Customer.find(params[:id])
    # @favorite_artist = FavoriteArtist.where(customer_id: @customer.id)
    @artists = Artist.where.not(id: @customer.artist_ids).order("RANDOM()")
  end

  def edit
    @customer = Customer.find(params[:id])
  end
  
  def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
      redirect_to customer_path(@customer)
    else
      render :edit
    end  
  end
  
  private
  def customer_params
    params.require(:customer).permit(:profile_image, :name, :nickname, :email)
  end
end
