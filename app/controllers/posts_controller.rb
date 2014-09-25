class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit]
  def index
  	@posts = Post.paginate(page: params[:page], per_page: 10)
    authorize @posts
  end

  def show
  	@post = Post.find(params[:id])
  end

  def new
    @post = Post.new
    authorize @post
  end

  def create
    @post = current_user.posts.build(params.require(:post).permit(:title, :body))
    authorize @post
    if @post.save
      flash[:notice] = "Post was saved."
      redirect_to @post
    else
      flash[:error] = "There was a problem saving your post.  Please try again."
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
    authorize @post
  end

  def update
    @post = Post.find(params[:id])
    authorize @post
    if @post.update_attributes(params.require(:post).permit(:title, :body))
      flash[:notice] = "Post was updated."
      redirect_to @post
    else 
      flash[:errror] = "There was a problem updating your post. Please try again."
      render :edit
    end
  end
end
