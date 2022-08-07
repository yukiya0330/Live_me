class Public::CustomersController < ApplicationController
  def show
    @customer = Customer.find(params[:id])
    @artists = Artist.where.not(id: @customer.artist_ids).order("RANDOM()")
    @artists = @artists.where(status: 1)
  end

  def edit
    @customer = Customer.find(params[:id])
  end
  
  def my_report
    @reports = current_customer.reports 
  end
  
  def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
      flash[:success] = "編集内容が保存されました"
      redirect_to customer_path(@customer)
    else
      flash.now[:danger] = "編集内容を確認してください"
      render :edit
    end
  end
  
  def withdraw
    current_customer.update(is_deleted: true)
    sign_out current_customer
    redirect_to root_path, notice: "正常に退会しました"
  end
  
  private
  def customer_params
    params.require(:customer).permit(:profile_image, :name, :nickname, :email)
  end
end
