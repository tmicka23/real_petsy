class Users::RegistrationsController < Devise::RegistrationsController

	before_action :user_params



	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		if @user.save
			redirect_to :edit, success: "votre compte à bien été créer, vous aller recevoir un mail de confirmation"
		else
			redirect_to new_user_registration_path, danger: "Une erreur est survenue lors de la création de votre compte"
		end
	end


	def edit
		
	end


	def update
		if current_user.update(user_params)
			redirect_to root_path, success: "votre compte à bien été modifié"
		else
			redirect_to :edit, danger: "erreur lors de la modification de votre compte"
		end
	end












	private



	def user_params
      params.require(:user).permit(:username, :login, :password, :password_confirmation, :avatar)
    end

	protected

	def update_resource(resource, params)
	  resource.update_without_password(params)
	end



end