class ContactformsController < ApplicationController
	
	def create
		@contactform = Contactform.new(params[:contactform])
		@contactform.request = request

		if @contactform.deliver 
			flash[:success] = flash
			redirect_to :back
		else @contactform
			flash[:error] = flash
			redirect_to :back
		end
	end	
end