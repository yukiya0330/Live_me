class Public::CommentsController < ApplicationController
  def create
    @comment = current_customer.comments.new(comment_params)
    @artist = @comment.artist
    @comment.save
  end
  
  def destroy
    @comment = Comment.find_by(id: params[:id])
    @artist = @comment.artist
    @comment.destroy
  end
  
  private
  def comment_params
    params.permit(:comment, :artist_id, :customer_id)
  end
end
