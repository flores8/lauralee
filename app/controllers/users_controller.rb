class UsersController < ApplicationController
	before_action :authenticate_user!

	def update
		if current_user.update_attributes(user_params)
			flash[:notice] = "Your information has been updated."
			redirect_to edit_user_registration_path
		else
			render "devise/registrations/edit"
		end
	end

	private

	def user_params 
		params.require(:user).permit(:name)
	end
end