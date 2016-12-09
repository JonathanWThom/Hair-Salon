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
  @client = Client.find(params.fetch('id').to_i())
  stylist_id = @client.stylist_id()
  @stylist = Stylist.find(stylist_id)
  erb(:client)
end

patch('/clients/:id') do
  name = params.fetch('new_name')
  @client = Client.find(params.fetch('id').to_i())
  @client.update({:name => name})
  stylist_id = @client.stylist_id()
  @stylist = Stylist.find(stylist_id)
  erb(:client)
end

delete('/clients/:id') do
  @client = Client.find(params.fetch('id').to_i())
  @client.delete()
  @clients = Client.all()
  stylist_id = @client.stylist_id()
  @stylist = Stylist.find(stylist_id)
  erb(:stylist)
end
