class PaymentsController < ApplicationController

 def create
  @product = Product.find(params[:product_id])
  @user = current_user
  @amount = @product.price * 100

  token = params[:stripeToken]
  # Create the charge on Stripe's servers - this will charge the user's card
  begin
   charge = Stripe::Charge.create(

    :amount => @amount.to_i,
    :currency => "usd",
    :source => token,
    :description => params[:stripeEmail]

    )
   if charge.paid
    Order.create(product_id: @product.id, user_id: @user.id, total: @product.price)
    UserMailer.order_payment(@user, @product).deliver_now
   end

  rescue Stripe::CardError => e
   # The card has been declined
   body = e.json_body
   err = body[:error]
   flash[:error] = "Unfortunately, there was an error processing your payment: #{err[:message]}"
  end
  
 end

end
