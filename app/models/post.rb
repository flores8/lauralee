class Post < ActiveRecord::Base
	before_save :generate_slug

	# Validations
	validates :slug, uniqueness: true, presence: true
	before_validation :generate_slug


	# Relationships
	has_many :comments
	belongs_to :user

	# Organize posts by the most recent first
	default_scope { order('created_at DESC')}

	# Pagination: Show 10 posts per page
	self.per_page = 10

	# Make the URL friend
	def to_param
		slug
	end

	def generate_slug
		self.slug ||= title.parameterize
	end
end
