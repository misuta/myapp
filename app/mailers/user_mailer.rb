class UserMailer < ApplicationMailer
	default from: "misuta@hotmail.com"

  require 'mail'

  Mail.defaults do
    delivery_method :smtp, {
      :address => 'smtp.sendgrid.net',
      :port => '587',
      :domain => 'heroku.com',
      :user_name => ENV['SENDGRID_USERNAME'],
      :password => ENV['SENDGRID_PASSWORD'],
      :authentication => :plain,
      :enable_starttls_auto => true
    }
  end

	def contact_form(email, name, message)
		@message = message
		mail(:from => email,
			:to => 'misuta@hotmail.com',
			:subject => "A new contact form message from #{name}")
	end

  def order_payment(user, product)
    @user = user
    @product = product
    mail(:from => 'misuta@hotmail.com',
      :to => @user.email,
      :subject => "Thank you for your purchase")
  end
end
