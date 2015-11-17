class CoursePolicy < ApplicationPolicy
	def index?
		true
	end
	def create?
    user.present? && (user.role?(:admin))
  end

  def new?
    create?
  end
end