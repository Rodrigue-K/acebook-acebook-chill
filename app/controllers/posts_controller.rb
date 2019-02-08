class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post = Post.create(message: post_params[:message], user_id:current_user_id)
    redirect_to posts_url
  end

  def index
    @posts = Post.all
    @comments = Comment.all
  end

  def show
    redirect_to posts_url
  end

  def destroy
     post = Post.find(params[:id])
     post.destroy
     redirect_to posts_path
  end


  private

  def post_params
    params.require(:post).permit(:message)
  end


  def current_user_id
    current_user['id']
  end
end
