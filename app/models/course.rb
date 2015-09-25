class Course < ActiveRecord::Base
	# Relationships

	# Validations
	validates :name, length: { minimum: 5 }, presence: true
end
