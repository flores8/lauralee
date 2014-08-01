class WelcomeController < ApplicationController
	before_action :authenticate_user!, :only => [:comingsoon]
  def index
  end

  def comingsoon
  end

  def freeimages
  end
end
