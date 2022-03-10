class PostsController < ApplicationController
  def new
    @post = Post.new
    @post.build_spot
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    @post.save
    redirect_to posts_path
  end

  def index
    @post = Post.new
    #@posts = Post.all
    @posts = Post.page(params[:page]).reverse_order
  end

  def show
    #@user = User.find(params[:id])
    @post = Post.find(params[:id])
    @comment = Comment.new
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    redirect_to post_path
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:title, :comment, :image, :page, :user_id)
  end

end
