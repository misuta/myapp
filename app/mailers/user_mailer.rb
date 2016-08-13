class UserMailer < ApplicationMailer
	default from: "misuta@hotmail.com"

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
