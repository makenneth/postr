class PostsController < ApplicationController
   include PostsHelper

  def new
    @post = Post.new
    render :new
  end

  def create
    @post = Post.new(post_params)
    @post.author = current_user
    @post.sub_id = params[:sub_id]
    @post.url = ensure_valid_link(params[:post][:url])
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

  def up_vote
     vote = Vote.new(vote_params)
     vote.count = ""
     #maybe try to find if such entry exists, if yes then
     post.up_vote
     redirect_to :back
  end

  def down_vote
     post = Vote.create()
     post.down_vote
     redirect_to :back
  end

  private
  def vote_params
     {
        user_id: current_user.id,
        voteable_type: "Post",
        voteable_id: params[:post_id]
     }
  end

  def post_params
    params.require(:post).permit(:title, :content, sub_ids:[])
  end
end
