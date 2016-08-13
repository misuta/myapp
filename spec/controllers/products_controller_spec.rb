require 'rails_helper'

describe ProductsController, :type => :controller do

	let(:product) { FactoryGirl.create(:product) }
	let(:user) { FactoryGirl.create(:user) }
	let(:admin) { FactoryGirl.create(:admin)}

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

	describe 'GET #index' do

		context 'User is not logged in' do

			it 'display index' do
				get :index

				expect(response).to be_success
				expect(response).to have_http_status(200)
			end
		end

		context 'User is logged in' do

			before do
				sign_in user
			end

			it 'display index' do
				get :index

				expect(response).to be_success
				expect(response).to have_http_status(200)	
			end

			
			
		end
	  
	end

	describe 'GET #show' do

		context 'User not logged in' do

			it 'display the product page' do

				get :show, params: { id: product.id}
				expect(response).to be_success
				expect(response).to have_http_status(200)
			end
		end

		context 'User logged in' do

			before do
				sign_in user
			end
			it 'display the product page' do

				get :show, params: { id: product.id }
				expect(response).to be_success
				expect(response).to have_http_status(200)
			end
		end
	end

	describe 'GET #new' do

		context 'User is not logged in' do

			it 'redirects user to products page' do

				get :new
				expect(response).not_to be_success
				expect(response).to have_http_status(302)
				
			end

		context 'User is logged in not admin' do

			before do
				sign_in user
			end

			it 'redirects user to products page' do
				get :new
				expect(response).not_to be_success
				expect(response).to have_http_status(302)
			end
		end

		context 'User logged in as admin' do

			before do
				sign_in admin
			end

			it 'Shows new product page' do

				get :new
				expect(response).to be_success
				expect(response).to have_http_status(200)
				
			end
			
		end
			
		end
	  
	end
  
end