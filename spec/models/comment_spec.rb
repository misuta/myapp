require 'rails_helper'

describe 'Comment' do

	context 'When comment is not valid' do

		let(:commnet_1) {FactoryGirl.build(:comment, user_id: "" )}
		let(:comment_2) { FactoryGirl.build(:comment, rating: nil) }
		let(:comment_3) { FactoryGirl.build(:comment )}
		it 'is not valid because of missing user' do

			expect(commnet_1).not_to be_valid
			
		end

		it 'is not valid because rating is missing' do

			expect(comment_2).not_to be_valid
			
		end

		it 'is valid' do

			expect(comment_3).to be_valid
			
		end
		
	end

	context 'factory test' do

		let(:comment) {build(:comment)}

		it 'shows if factory is working' do

			expect(comment).to be_valid
			
		end
	end
  
end