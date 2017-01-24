class RegistrationsController < Devise::RegistrationsController

	def update_resource(resource, params)
	  resource.update_without_password(params)
	end

	def create
	  super
	end

	def update
	  # For Rails 4
	  account_update_params = devise_parameter_sanitizer.sanitize(:account_update)

	  # required for settings form to submit when password is left blank
	  if account_update_params[:password].blank?
	    account_update_params.delete("password")
	    account_update_params.delete("password_confirmation")
	  end

	  @user = User.find(current_user.id)

	  @update = update_resource(@user, account_update_params)
	  if @update 
	    # Sign in the user bypassing validation in case their password changed
	    sign_in @user, :bypass => true
	  end

	  respond_to do |format|
	    format.html
	    format.js
	  end
	end

  # protected

  #   def after_update_path_for(resource)
		# edit_user_registration_path(resource)
  #   end
end