class CommentsController < ApplicationController
  def new
    render :new
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.author = current_user
    @comment.save
    redirect_to post_url(params[:post_id])
  end

  private
  def comment_params
    params.require(:comment)
          .permit(:body, :commentable_id, :commentable_type)
  end
end
