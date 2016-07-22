require 'rails_helper'

describe ProductsController, :type => :controller do

	let(:product) { create(:product) }
	let(:user) { create(:user) }
	let(:admin) { create(:user, email: "another@email.com", password:"1234567890", admin: true)}

	describe 'GET #new' do

		context 'No user is logged in' do

			it 'redirects to products' do

				get :new

				expect(response).not_to be_success
				expect(response).to have_http_status(302)
				expect(response).to redirect_to(new_user_session_path)
			end
		end

		context 'User is logged in' do

			before do
				sign_in user
			end

			it 'redirects to products' do

				get :new

				expect(response).not_to be_success
				expect(response).to have_http_status(302)
				expect(response).to redirect_to(root_path)

			end

			context 'Admin is logged in' do

				before do
					sign_in admin
				end

				it 'loads form for new product' do

					get :new

					expect(response).to be_success
					expect(response).to have_http_status(200)
					
				end
				
			end
			
		end
	end
  
end