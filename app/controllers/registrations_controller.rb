class RegistrationsController < Devise::RegistrationsController

	def update_resource(resource, params)
	  resource.update_without_password(params)
	end

	def after_sign_up_path_for(resource)
	  edit_user_registration_path
	end

	def create
	  super

	  if @user.persisted?
	    AdminMailer.new_registration_alert(@user).deliver_now
	    # flash[:notice] = "Welcome to METAS!"
	  else
	  	# redirect_to :back
	  end	

	end

	def update
		@contactform = Contactform.new

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
end