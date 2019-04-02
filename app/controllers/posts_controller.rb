class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)
    redirect_to root_url
  end

  def index
    @posts = Post.all.order('created_at DESC')
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.update(post_creator_params)
    redirect_to root_url
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to root_url
  end

  private
  def post_params
    params.require(:post).permit(:message, :user_id)
  end

  def post_creator_params
    params.require(:post).permit(:message, :user_id)
  end
end
