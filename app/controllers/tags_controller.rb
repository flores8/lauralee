class TagsController < ApplicationController
  def index
  	@tags = ActsAsTaggableOn::Tag.most_used(10)
  	# @posts = Post.tagged_with(params[:id])
  end

  def show
  	@posts = Post.tagged_with(params[:tag])
  	@tags = ActsAsTaggableOn::Tag.most_used(10)
  end
end
