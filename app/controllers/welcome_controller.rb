class WelcomeController < ApplicationController

  def index
    @post = Post.order("created_at DESC").limit(5)
  end

  def resources
  	@feedback = Feedback.new
  end

  def freeimages

  end

  def about_me
  end

  def about
  end

  def test
  end

  def varsitytutors
  end

	def confirm_subscription
	end
end
