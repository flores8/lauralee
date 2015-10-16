class Lesson < ActiveRecord::Base
	before_save :generate_slug

	# Validations
	validates :title, presence: true
	validates :body, presence: true
	validates :lesson_number, presence: true, uniqueness: true
	validates :slug, uniqueness: true, presence: true
	before_validation :generate_slug

	def next_lesson
		self.lesson_number + 1
	end
	
	def previous_lesson
		self.lesson_number - 1
	end

	def complete_lesson
		self.complete = true
	end

	# Make the URL friendly
	def to_param
		slug
	end

	def generate_slug
		self.slug ||= title.parameterize
	end
end
