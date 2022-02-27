class UsersController < ApplicationController
  before_action :set_user, only: [:likes]

  def show
    @user = current_user
  end
  def edit
    @user = current_user
    #@user = User.find(params[:id])
  end
  def unsubscribe
    @user = current_user
  end

  def withdraw
    @user = current_user
    @user.update(is_active: false)
    reset_session
    redirect_to root_path
  end

  #def likes
    #likes = Like.where(user_id: @user.id).pluck(:post_id)
    #@like_posts = Post.find(likes)
  #end

  private

  def user_params
    params.require(:user).permit(:name, :name_kana, :user_name, :age, :password, :email)
  end
  def set_user
    @user = User.find(params[:id])
  end
end
