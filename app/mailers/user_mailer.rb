class UserMailer < ApplicationMailer
	default from: "misuta@hotmail.com"

	def contact_form(email, name, message)
		@message = message
		mail(:from => email,
			:to => 'misuta@hotmail.com',
			:subject => "A new contact form message from #{name}")
	end
end
