module ApplicationHelper
	def markdown(text)
		renderer = Redcarpet::Render::HTML.new
		extensions = {fenced_code_blocks: true}
		redcarpet = Redcarpet::Markdown.new(renderer, extensions)
		(redcarpet.render text).html_safe
	end
	
	def resource_name
    :user
  end
 
  def resource
    @resource ||= User.new
  end
 
  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end
end
