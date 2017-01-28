class ContactformsController < ApplicationController
	
	def create
		@contactform = Contactform.new(params[:contactform])
		@contactform.request = request

		if @contactform.deliver 
			flash[:notice] = 'Your email has been sent!'
			redirect_to :back
		else @contactform
			flash[:error] = "There has been an error and your email wasn't sent. Please try again."
			redirect_to :back
		end
	end	
end