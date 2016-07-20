require 'rails_helper'

describe User do

	context 'when user is created' do

		it 'is not valid' do

			expect(User.new(first_name: "John")).not_to be_valid
			
		end

		it 'is not valid but has email and password' do

			expect(User.new(email: "otro@mail.net", password:"123456")).to be_valid
			
		end

	end

end