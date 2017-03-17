class AdminMailer < ActionMailer::Base

	default from: "Metas <hi@metas.io>"

	def new_registration_alert(user)
		@user = user
		mail(to: 'hi@metas.io', subject: 'We have a new METAS user')
	end
end

