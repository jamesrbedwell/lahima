get '/clients/new' do
  redirect to '/' unless logged_in?
  erb :'clients/new_client'
end

get '/clients/list' do
  redirect to '/' unless logged_in?
  @clients = Client.all
  erb :'clients/list_clients'
end

post '/clients' do
  client = Client.new
  client.name = params[:name]
  client.abn = params[:abn]
  client.address1 = params[:address1]
  client.city = params[:city]
  client.state = params[:state]
  client.country = params[:country]
  client.post_code = params[:post_code]
  client.labour_rate = params[:labour_rate]
  client.ticketed_rate = params[:ticketed_rate]
  client.trade_rate = params[:trade_rate]
  client.user_id = current_user.id
  client.save

  client_contact = ClientContact.new
  client_contact.first_name = params[:contact_first_name]
  client_contact.last_name = params[:contact_last_name]
  client_contact.phone = params[:contact_phone]
  client_contact.email = params[:contact_email]
  client_contact.client_id = client.id
  client_contact.save
  
  redirect to("/clients/#{client.id}")
end

get '/clients/:id/edit' do
  redirect to '/' unless logged_in?
  @client = Client.find(params[:id])
  erb :'clients/edit_client'
end

put '/clients/:id' do
  client = Client.find(params[:id])
  client.name = params[:name]
  client.abn = params[:abn]
  client.address1 = params[:address1]
  client.city = params[:city]
  client.state = params[:state]
  client.country = params[:country]
  client.post_code = params[:post_code]
  client.labour_rate = params[:labour_rate]
  client.ticketed_rate = params[:ticketed_rate]
  client.trade_rate = params[:trade_rate]
  client.user_id = current_user.id
  client.save

  redirect to("/clients/#{client.id}")
end

delete '/clients/:id' do
  client = Client.find(params[:id])
  client.destroy #would make sense to change a status to inactive as will need to keep details on record.
  redirect to('/dashboard')
end

get '/clients/:id' do
  redirect to '/' unless logged_in?
  @client = Client.find(params[:id])
  erb :'clients/client'
end
