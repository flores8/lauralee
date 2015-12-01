class Lesson < ActiveRecord::Base
	before_save :generate_slug

	#Relationships
	belongs_to :course

	# Validations
	validates :title, presence: true
	validates :body, presence: true
	validates :lesson_number, presence: true
	validates :slug, uniqueness: true, presence: true
	before_validation :generate_slug

	def next_lesson
		if self.course.lessons.count > 1
			lessons_in_course = Lesson.where(course_id: self.course_id)
			lessons_in_course.where(lesson_number: self.lesson_number + 1)
		end
	end
	
	def previous_lesson
		if self.course.lessons.count > 1
			lessons_in_course = Lesson.where(course_id: self.course_id)
			lessons_in_course.where(lesson_number: self.lesson_number - 1)
		end
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
