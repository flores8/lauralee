class Feedback < ActiveRecord::Base
	belongs_to :user

	# Validations
	validates :most_interested, length: { minimum: 5 }, presence: true
	validates :user, presence: true
end
