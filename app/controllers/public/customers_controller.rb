# frozen_string_literal: true

class Public::CustomersController < ApplicationController
  before_action :ensure_current_customer

  def show
    @customer = Customer.find(params[:id])
    if Rails.env.production?
      @artists = Artist.where.not(id: @customer.artist_ids).order("RAND()")
    elsif Rails.env.development?
      @artists = Artist.where.not(id: @customer.artist_ids).order("RANDOM()")
    end
    @artists = @artists.where(status: 1)
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def my_report
    @customer = Customer.find(params[:customer_id])
    @reports = @customer.reports
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
    flash[:success] = "正常に退会しました"
    redirect_to root_path
  end
  
  def ensure_current_customer
    @customer = Customer.find(params[:id])
    if @customer.id != current_customer.id
  		flash[:notice] = "権限がありません"
  		redirect_to root_path
    end  
  end  

  private
    def customer_params
      params.require(:customer).permit(:profile_image, :name, :nickname, :email)
    end
end
