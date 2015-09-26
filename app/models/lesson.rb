class Lesson < ActiveRecord::Base
	# Validations
	validates :title, presence: true
	validates :body, presence: true
	validates :lesson_number, presence: true, uniqueness: true

	def next_lesson
		self.lesson_number + 1
	end
	
	def previous_lesson
		self.lesson_number - 1
	end
end
