class AdminMailer < ActionMailer::Base

	default from: 'metastest10@gmail.com'

	def new_registration_alert(user)
		@user = user
		mail(to: 'karensanchez0891@gmail.com', subject: 'We have a new METAS user')
	end
end
