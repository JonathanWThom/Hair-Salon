require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('adding a new stylist', {:type => :feature}) do
  it('allows the user to add a stylist') do
    visit('/')
    fill_in('stylist_name', :with => 'Milhouse Van Houten')
    click_button('Add a Stylist')
    expect(page).to have_content('Milhouse Van Houten')
  end
end
