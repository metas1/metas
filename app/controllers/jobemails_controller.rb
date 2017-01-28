class JobemailsController < ApplicationController

	def create
		@jobemail = Jobemail.new(params[:jobemail])
		@jobemail.request = request

		if @jobemail.deliver 
			# flash[:notice] = "Your email has been sent"
		else @jobemail
			# flash[:error] = "There has been an error"
		end
	end	
end