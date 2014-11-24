class WelcomeController < ApplicationController
	# before_action :authenticate_user!, :only => [:comingsoon]
	
  def index
    @post = Post.order("created_at DESC").limit(5)
  end

  def comingsoon
  	@feedback = Feedback.new
  end

  def freeimages
  end

  def about_me
  end

  def about
  end
end
