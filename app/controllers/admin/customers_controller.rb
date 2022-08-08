class Admin::CustomersController < ApplicationController
  before_action :authenticate_admin!
  
  def index
    @customers = Customer.page params[:page]
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
      flash[:success] = "編集内容が保存されました"
      redirect_to admin_customer_path(@customer)
    else
      flash.now[:danger] = "編集内容を確認してください"
      render :edit
    end 
  end
  
  def destroy
    @customer = Customer.find(params[:id])
    @customer.destroy
    flash[:success] = "一件のユーザーが削除されました"
    redirect_to admin_customers_path
  end
  
  private
  def customer_params
    params.require(:customer).permit(:name, :nickname, :email, :is_deleted, :profile_image)
  end
end
