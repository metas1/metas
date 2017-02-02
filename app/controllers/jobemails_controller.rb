class JobemailsController < ApplicationController

	def create
		@jobemail = Jobemail.new(params[:jobemail])
		@jobemail.request = request

		if @jobemail.deliver 
			# flash[:success] = flash
			# redirect_to :back
		else @jobemail
			# flash[:error] = flash
			# redirect_to :back
		end	
		respond_to do |format|
		  format.html
		  format.js
		end
	end	
end