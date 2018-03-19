class Users::RegistrationsController < Devise::RegistrationsController


	def new
		
	end


	def edit
		
	end


	protected

	def update_resource(resource, params)
	  resource.update_without_password(params)
	end



end