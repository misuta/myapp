require 'rails_helper'

describe User, :type => :model do

	context 'when user is created with an empty email' do

		let (:user) {FactoryGirl.build(:user, email: "")}

		it 'is not valid' do

			expect(user).not_to be_valid
			
		end
	end
	context 'When user is created with not a valid email' do

		let(:user) {FactoryGirl.build(:user, email: "not_an_email")}

		it 'should not validate users without an email address' do
			expect(user).to_not be_valid	
		end
	end

	context 'When user is created with valid information' do
		let(:user) {FactoryGirl.build(:user)}

		it 'is valid' do
			expect(user).to be_valid
		end
	end
end