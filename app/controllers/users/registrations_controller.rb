class Users::RegistrationsController < Devise::RegistrationsController

	



	def new
		@user = User.new
	end

	def create
		@user = User.new(sign_up_params)
		if @user.save
			redirect_to edit_user_registration_path, success: "votre compte à bien été créer, vous aller recevoir un mail de confirmation"
		else
			redirect_to new_user_registration_path, danger: "Une erreur est survenue lors de la création de votre compte"
		end
	end


	def edit
		current_user		
	end


	def update
		if current_user.update(account_update_params)
			redirect_to root_path, success: "votre compte à bien été modifié"
		else
			redirect_to edit_user_registration_path, danger: "erreur lors de la modification de votre compte"
		end
	end












	private


    def sign_up_params
      params.require(:user).permit(:email, :username, :password, :password_confirmation)
    end

    def account_update_params
      params.require(:user).permit(:email, :username, :password, :password_confirmation, :avatar , :login)
    end

	protected

	def update_resource(resource, params)
	  resource.update_without_password(params)
	end



end