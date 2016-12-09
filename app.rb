require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/client')
require('./lib/stylist')
require('pg')

DB = PG.connect(:dbname => 'hair_salon')

get('/') do
  @stylists = Stylist.all()
  erb(:index)
end

post('/stylists') do
  name = params.fetch('stylist_name')
  stylist = Stylist.new({:name => name, :id => nil})
  stylist.save()
  @stylists = Stylist.all()
  erb(:index)
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

patch('/stylists/:id') do
   name = params.fetch('new_name')
   @stylist = Stylist.find(params.fetch('id').to_i())
   @stylist.update({:name => name})
   erb(:stylist)
end

delete('/stylists/:id') do
  @stylist = Stylist.find(params.fetch('id').to_i())
  @stylist.delete()
  @stylists = Stylist.all()
  erb(:index)
end

get('/clients/:id') do
  @client = Client.find('id')
  stylist_id = @client.stylid_id()
  @stylist = Stylist.find(stylist_id)
  erb(:client)
end

# patch('/clients/:id') do
#   name = params.fetch('new_name')
#   @client = Stylist.find(params.fetch('id').to_i())
#   @stylist.update({:name => name})
#   erb(:stylist)
# end
#patch clients
#delete clients



# As a salon owner, I want to view, add, update and delete stylists.
# As a salon owner, I want to view, add, update and delete clients.
# As a salon owner, I want to add clients to a stylist.
