class PostsController < ApplicationController
  before_action :find_post, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @posts= Post.all.order("created_at DESC")
    if params[:search]
    @posts = Post.search(params[:search]).order("created_at DESC")
  else
    @posts = Post.all.order("created_at DESC")
  end
  end

  def show
    @comments = Comment.where(post_id: @post)
  end

  def new
    @post = current_user.posts.build
  end


  def create
    @post = current_user.posts.build(post_params)

    if @post.save
      redirect_to @post
    else
      render 'new'
    end
  end

  def edit 
  end

  def update
    if @post.update(post_params)
      redirect_to @post
    else
      render 'edit'
    end
  end

  def destroy
    @post.destroy
    redirect_to root_path
  end

  def userposts
    @posts = current_user.posts
  end

  private
  
  def find_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:price, :photo, :title, :description, :suburb)
  end
end
