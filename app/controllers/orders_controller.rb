class OrdersController < ApplicationController
 before_filter :authenticate_user!
 before_action :authenticate_user!
 load_and_authorize_resource

 def index
  @order = Order.accessible_by(current_ability)
 end

 def create
  if current_user.admin?
    @order = Order.new(order_params)
  else
   @order = Order.new(order_params)
   @order.user = current_user
  end
   respond_to do |format|
    if @order.save
     format.html { redirect_to @order, notice: 'Order was succesfully create.'}
     format.json { render :show, status: :created, location: @order }
    else
     format.html { render :new }
     format.json { render json: @order.errors, status: :unprocessable_entity }
     end
   end
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