# Hey Franz,
# I read your notes about integration specs last week, about how I was being a bit too redundant in my testing. I have to confess that I'm still not totally sure how *not* to do that and still have them pass - especially when there are certain links I need to click on to get to the next page. I'll put my name on the whiteboard to talk to you this week, especially about this.


require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('adding a new stylist', {:type => :feature}) do
  it('allows the user to add a stylist and view their page') do
    visit('/')
    fill_in('stylist_name', :with => 'Milhouse Van Houten')
    click_button('Add a Stylist')
    click_link('Milhouse Van Houten')
    expect(page).to have_content('Milhouse Van Houten')
  end
end

describe('modifying a stylist\'s name', {:type => :feature}) do
  it('allows the user to change the name of stylist') do
    stylist = Stylist.new({:name => 'Milhouse Van Houten', :id => nil})
    stylist.save()
    visit("/stylists/#{stylist.id()}")
    fill_in('new_name', :with => 'Lenny')
    click_button('Change Name')
    expect(page).to have_content('Lenny')
  end
end

describe('deleting a stylist', {:type => :feature}) do
  it('allows the user to delete a stylist') do
    stylist = Stylist.new({:name => 'Milhouse Van Houten', :id => nil})
    stylist.save()
    visit("/stylists/#{stylist.id()}")
    click_button('Get Outta My Sight!')
    expect(page).not_to have_content('Milhouse Van Houten')
  end
end

describe('adding and viewing a client profile', {:type => :feature}) do
  it('allows user to add a client to a stylist page') do
    stylist = Stylist.new({:name => 'Milhouse Van Houten', :id => nil})
    stylist.save()
    visit("/stylists/#{stylist.id()}")
    fill_in('client_name', :with => 'Karl')
    click_button('Add Client')
    click_link('Karl')
    expect(page).to have_content('Karl')
  end
end

describe('deleting a client', {:type => :feature}) do
  it('allows user to delete a client') do
    stylist = Stylist.new({:name => 'Milhouse Van Houten', :id => nil})
    stylist.save()
    client = Client.new({:name => 'Karl', :stylist_id => "#{stylist.id()}", :id => nil})
    client.save()
    visit("/clients/#{client.id()}")
    click_button('Delete \'Em!')
    expect(page).not_to have_content('Karl')
  end
end

describe('modifying a client name', {:type => :feature}) do
  it('allows user to change a client\'s name') do
    stylist = Stylist.new({:name => 'Milhouse Van Houten', :id => nil})
    stylist.save()
    client = Client.new({:name => 'Karl', :stylist_id => "#{stylist.id()}", :id => nil})
    client.save()
    visit("/clients/#{client.id()}")
    fill_in('new_name', :with => 'Chief Wiggum')
    click_button('Change Name')
    expect(page).to have_content('Chief Wiggum')
  end
end
