class Admin::CustomersController < ApplicationController
  def index
    @customers = Customer.all
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
  end
  
  def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
      redirect_to admin_customer_path(@customer), notice: "変更が保存されました"
    else
      render :edit
    end 
  end
  
  private
  def customer_params
    params.require(:customer).permit(:name, :nickname, :email, :is_deleted)
  end
end
