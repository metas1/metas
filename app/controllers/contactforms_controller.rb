class ContactformsController < ApplicationController
	
	def create
		@contactform = Contactform.new(params[:contactform])
		@contactform.request = request

		if @contactform.deliver 
			flash[:success] = 'Well done! Your message was successfully sent.'
			redirect_to :back
		else @contactform
			flash[:error] = "There has been an error and your email wasn't sent. Please try again."
			redirect_to :back
		end
	end	
end