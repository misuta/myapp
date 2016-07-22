require 'rails_helper'

describe User do

	context 'when user is created' do

		it 'is not valid' do
			user = build(:user, email: "")
			expect(user).not_to be_valid
			
		end

		it 'is valid' do
			user = build(:user)
			expect(user).to be_valid
			
		end

	end

end