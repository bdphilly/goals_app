class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    unless @comment.save
      flash[:errors] = @comment.errors.full_messages
    end
    redirect_to @comment.commentable
  end

  private
  def comment_params
    params.require(:comment).permit(:body, :commentable_id, :commentable_type)
  end
end
