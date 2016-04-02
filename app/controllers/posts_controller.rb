class PostsController < ApplicationController
  def new
    @post = Post.new
    render :new
  end

  def create
    @post = Post.new(post_params)
    @post.author = current_user
    @post.sub_id = params[:sub_id]
    if @post.save
      redirect_to sub_url(params[:sub_id])
    else
      render :new
    end
  end

  def edit
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
    render :show
  end

  private
  def post_params
    params.require(:post).permit(:title, :url, :content, sub_ids:[])
  end
end
