require 'rails_helper'

RSpec.describe PaymentsController, type: :controller do

  let(:product) {FactoryGirl.create(:product)}
  let(:user) {FactoryGirl.create(:user)}


  describe "test stripe", :type => :feature, js: true do

    before do
      sign_in user

      visit '/products/1'

      click_button "Pay_with_Card"
      sleep(2) # allows stripe_checkout_app frame to load
      stripe_iframe = all('iframe[name=stripe_checkout_app]').last
        Capybara.within_frame stripe_iframe do
          fill_in "email", with: "misuta@hotmal.com"
          4.times{find('#card_number').send_keys('4242')}
          page.driver.browser.find_element(:id, 'cc-exp').send_keys '12'
          page.driver.browser.find_element(:id, 'cc-exp').send_keys '18'

          page.driver.browser.find_element(:id, 'cc-csc').send_keys '123'
          find('button[type=submit]').click
          sleep(3) # allows stripe_checkout_app to submit
        end
    end

    it "should successfully process the request" do
      post :create, params: { product_id: product.id, token: token }

        expect(response).to be_success
        expect(response).to have_http_status(200)
    end 
  end
end
