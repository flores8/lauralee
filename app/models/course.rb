class Course < ActiveRecord::Base
	# Relationships
	has_many :lessons

	# Validations
	validates :name, length: { minimum: 5 }, presence: true
	validates :slug, uniqueness: true, presence: true

	before_validation :generate_slug

	def to_param
		slug
	end

	def generate_slug
		self.slug ||= name.parameterize
	end
end
