# frozen_string_literal: true

class Public::ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end

  def confirm
    @contact = Contact.new(contact_params)
    if @contact.invalid?
      render :new
    end
  end

  def back
    @contact = Contact.new(contact_params)
    render :new
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      redirect_to done_path
    else
      flash[:danger] = "編集内容を確認してください"
      render :new
    end
  end

  private
    def contact_params
      params.require(:contact).permit(:email, :name, :phone_number, :subject, :message)
    end
end
