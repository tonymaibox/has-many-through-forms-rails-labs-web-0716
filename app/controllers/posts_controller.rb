class PostsController < ApplicationController

  # before_action :set_post, only: [:show, :edit, :update]

  def show
    @post = Post.find(params[:id])
    # byebug
    @post_users = []
    @post.users.each do |user|
      unless @post_users.include?(user)
        @post_users << user
      end
    end
    @comment = Comment.new
    # @comment.user.build
    # binding.pry
  end

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    post = Post.create(post_params)
    redirect_to post
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :content, category_ids:[], categories_attributes: [:name])
  end
end
