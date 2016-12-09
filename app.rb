require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/client')
require('./lib/stylist')
require('pg')

DB = PG.connect(:dbname => 'hair_salon')

get('/') do
  erb(:index)
end

get('/stylists') do
  @stylists = Stylist.all()
  erb(:stylists)
end

get('/clients') do
  @clients = Client.all()
  erb(:clients)
end

post('/stylists') do
  name = params.fetch('stylist_name')
  stylist = Stylist.new({:name => name, :id => nil})
  stylist.save()
  @stylists = Stylist.all()
  erb(:stylists)
end

get('/stylists/:id') do
  @stylist = Stylist.find(params.fetch('id').to_i)
  erb(:stylist)
end

post('/stylists/:id') do
  name = params.fetch('client_name')
  stylist_id = params.fetch('stylist_id')
  id = nil
  client = Client.new({:name => name, :stylist_id => stylist_id, :id => id})
  client.save()
  @stylist = Stylist.find(params.fetch('id').to_i)
  erb(:stylist)
end

#add stylist
#add client to stylist
#patch stylists
#delete stylists

#add client
#patch clients
#delete clients



# As a salon owner, I want to view, add, update and delete stylists.
# As a salon owner, I want to view, add, update and delete clients.
# As a salon owner, I want to add clients to a stylist.
