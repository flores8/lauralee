class PlaygroundController < ApplicationController
  def show
    if valid_page?
      render template: "playground/#{params[:page]}"
    else
      render file: "public/404.html", status: :not_found
    end
  end

  private

  def valid_page?
    File.exist?(Pathname.new(Rails.root + "app/views/playground/#{params[:page]}.html.erb"))
  end
end
