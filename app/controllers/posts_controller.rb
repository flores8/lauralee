class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit]
  before_action :find_page, only: [:show, :edit, :update, :destroy]

  def index
  	@posts = Post.paginate(page: params[:page], per_page: 10)
    authorize @posts
  end

  def show
  end

  def new
    @post = Post.new
    authorize @post
  end

  def create
    @post = current_user.posts.build(user_params)
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
    authorize @post
  end

  def update
    authorize @post
    if @post.update_attributes(user_params)
      flash[:notice] = "Post was updated."
      redirect_to @post
    else 
      flash[:errror] = "There was a problem updating your post. Please try again."
      render :edit
    end
  end

  def destroy
    authorize @post
    @post.destroy

  end

  private

  def user_params 
    params.require(:post).permit(:title, :body, :slug, :tag_list, :skill_list, :interest_list)
  end

  def find_page
    @post = Post.find_by_slug!(params[:id])
  end
  helper_method :page

end
