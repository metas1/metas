class JobemailsController < ApplicationController

	def create
		@jobemail = Jobemail.new(params[:jobemail])
		@jobemail.request = request

		if @jobemail.deliver 
			# flash[:notice] = "good"
		else @jobemail
			# flash[:error] = "error"
		end
	end	
end