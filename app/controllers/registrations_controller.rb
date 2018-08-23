class RegistrationsController < Devise::RegistrationsController 

	private

	def sign_up_params 
		params.require(:user).permit(:name, :username, :email, :company_name, :password, :password_confirmation)
	end

	def acount_update_params 
		params.require(:user).permit(:name, :username, :company_name, :email, :password, :password_confirmation, :current_password)
	end

end
