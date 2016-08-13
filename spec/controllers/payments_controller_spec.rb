require 'rails_helper'

RSpec.describe PaymentsController, type: :controller do

  let(:product) {FactoryGirl.create(:product)}
  let(:user) {FactoryGirl.create(:user)}

  describe 'POST #create' do

    context 'user is logged in'
    before do

      sign_in user

    end

    it 'redirects to products' do

      require "stripe"
      Stripe.api_key = "sk_test_blX1ipcpssNMb4oSgOQWXEjV"

      Stripe::Token.create(
        :card => {
          :number => "4242424242424242",
          :exp_month => 8,
          :exp_year => 2017,
          :cvc => "314"
        },
      )


      post :create, params: { product_id: product.id, token: token }

      expect(response).not_to be_success
      expect(response).to have_http_status(302)
      expect(response).to redirects_to(products_path)
      
    end
    
  end

end
