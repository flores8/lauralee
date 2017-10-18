class Post < ActiveRecord::Base
	before_save :generate_slug
	acts_as_taggable
	acts_as_taggable_on :topics, :skills

	# Validations
	validates :slug, uniqueness: true, presence: true
	before_validation :generate_slug
	validates :title, length: { minimum: 5 }, presence: true
	validates :body, length: { minimum: 20 }, presence: true
	validates :user, :description, presence: true
	validates_presence_of :image
	scope :published, -> {where(published: true)}

	mount_uploader :image, BlogUploader

	def published?
    self.published == true
  end

	# How Long A Post Will Take to Read
	def word_count
		self.body.split.size
	end

	def reading_time
		(word_count / 180.0).ceil
	end


	# Relationships
	has_many :comments
	belongs_to :user

	# Organize posts by the most recent first
	default_scope { order('published_on DESC')}

	# Pagination: Show 10 posts per page
	self.per_page = 10

	# Make the URL friendly
	def to_param
		slug
	end

	def generate_slug
		self.slug ||= title.parameterize
	end
end
