class OrdersController < ApplicationController

	def index
		@orders = Order.all
	end

	def create
		
	end

	def show
		
	end

	def new
		
	end

	def destroy
		
	end

	private

	def order_params
	  params.require(:order).permit(:id, :total, :product_id, :user_id)
	end

end