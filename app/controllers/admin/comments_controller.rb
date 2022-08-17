# frozen_string_literal: true

class Admin::CommentsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @customer = Customer.find(params[:customer_id])
    @comments = @customer.comments.order(created_at: "DESC")
  end

  def show
    @comment = Comment.find(params[:id])
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    flash[:notice] = "一件のコメントが削除されました"
    redirect_to admin_comments_path(customer_id: @comment.customer.id)
  end
end
