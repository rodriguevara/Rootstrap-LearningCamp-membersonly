class PostsController < ApplicationController
  before_action :authenticate_user! , except: [:index, :show]

  def new
    @post = current_user.posts.build
  end

  def create
    @post = current_user.posts.build(posts_params)
    if @post.save
      redirect_to posts_path, notice: 'Post was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def index
    @posts = Post.all
  end

  private
    def posts_params
      params.require(:post).permit(:title, :body, :user_id)
    end
end
