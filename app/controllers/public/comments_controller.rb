class Public::CommentsController < ApplicationController
  def create
    comment = current_customer.comments.new(comment_params)
    comment.save
    redirect_to request.referer
    logger.debug comment.errors.inspect 
  end
  
  def destroy
    comment = Comment.find_by(id: params[:id])
    comment.destroy
    redirect_to request.referer
  end
  
  private
  def comment_params
    params.permit(:comment, :artist_id, :customer_id)
  end
end
