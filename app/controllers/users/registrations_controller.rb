class Users::RegistrationsController < Devise::RegistrationsController

	before_action :user_params



	def edit
	end



	protected

	def update_resource(resource, params)
	  resource.update_without_password(params)
	end



	private

	def user_params
	 user_params = params(current_user).permit(:username, :avatar)
	end

end