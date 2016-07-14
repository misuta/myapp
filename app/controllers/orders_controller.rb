class OrdersController < ApplicationController
	before_filter :authenticate_user!
	before_action :authenticate_user!, :except => [:show, :index]
	load_and_authorize_resource

	def index
		@order = Order.accessible_by(current_ability)
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