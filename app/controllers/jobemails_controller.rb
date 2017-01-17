class JobemailsController < ApplicationController

	def create
		@jobemail = Jobemail.new(params[:jobemail])
		@jobemail.request = request
		if @jobemail.deliver
			flash.now[:notice] = 'Email delivered'
		    render :partial => "partials/updatedprofile" 
		else
			flash.now[:error] = 'Error'
			
		end		
	end	
end
