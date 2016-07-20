require 'rails_helper'

describe 'Comment' do

	context 'When comment is not valid' do

		before do
			@product = Product.new(name: "another bike")
			@user = User.new(email:"otro@email.net", password:"123456")

		end

		it 'is not valid because of missing user' do

			expect(@product.comments.new(rating: 1, body: "this is an awful bike!")).not_to be_valid
			
		end

		it 'is not valid because rating is missing' do

			expect(@product.comments.new(user: @user, body: "this is good")).not_to be_valid
			
		end

		it 'is valid' do

			expect(@product.comments.new(user: @user, body:"is ok", rating: 2)).to be_valid
			
		end
		
	end
  
end