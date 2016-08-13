require 'rails_helper'



describe 'home page', :type => :feature do
  it 'welcomes the user' do
    visit '/'
    expect(page).to have_content('Welcome')
  end
end