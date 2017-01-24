class JobemailsController < ApplicationController

	def create
		@jobemail = Jobemail.new(params[:jobemail])
		@jobemail.request = request
		if @jobemail.deliver
		    # redirect_to :back, :flash => {:notice => "Email delivered!"}		
		else
			redirect_to :back, :flash => {:error => "Unable to send email, make sure all fields are filled!"}	
		end		
	end	
end