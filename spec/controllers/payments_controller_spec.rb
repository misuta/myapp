require 'stripe_mock'
require 'rails_helper'

RSpec.describe PaymentsController, type: :controller do

  let(:product) {FactoryGirl.create(:product)}
  let(:user) {FactoryGirl.create(:user)}


  describe "test stripe", :type => :feature, js: true do
    let(:stripe_helper) { StripeMock.create_test_helper}
    before { StripeMock.start}
    after { StripeMock.stop}
    before do
      sign_in user
    end

    it "should successfully process the request" do

      token = stripe_helper.generate_card_token(card_params={exp_year: 19, cvc: 123})
      post :create, params: { product_id: product.id }

        expect(response).to be_success
        expect(response).to have_http_status(200)
    end 
  end
end
