require 'rails_helper'

describe OrdersController, :type => :controller do

	let(:user) { create(:user) }
	let(:product) { create(:product) }
	let(:order) { Order.create!(user_id: user.id, product_id: product.id)}

	describe 'GET #show' do

		context 'user is logged in' do
			before do
				sign_in user
			end

			it 'loads order correctly' do

				get :show, id: order.id
				expect(response).to be_success
				expect(response).to have_http_status(200)
				
			end
		end
		context 'user is not logged in' do
			it 'redirects to root' do
				get :show, id: order.id
				expect(response).not_to be_success
				expect(response).to have_http_status(302)
				expect(response).to redirect_to(new_user_session_path)
			end
		end
	end
end