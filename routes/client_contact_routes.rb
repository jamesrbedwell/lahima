get '/client_contacts/new' do
  redirect to '/' unless logged_in?
  erb :'client_contacts/new_client_contact'
end

post '/client_contacts' do
  client_contact = ClientContact.new
  client_contact.first_name = params[:first_name]
  client_contact.last_name = params[:last_name]
  client_contact.phone = params[:phone]
  client_contact.email = params[:email]
  client_contact.client_id = params[:client_id]
  client_contact.save

  redirect to("/client_contacts/#{client_contact.id}")
end

get '/client_contacts/:id/edit' do
  redirect to '/' unless logged_in?
  @client_contact = ClientContact.find(params[:id])
  erb :'client_contacts/edit_client_contact'
end

put '/client_contacts/:id' do
  client_contact = ClientContact.find(params[:id])
  client_contact.first_name = params[:first_name]
  client_contact.last_name = params[:last_name]
  client_contact.phone = params[:phone]
  client_contact.email = params[:email]
  client_contact.client_id = params[:client_id]
  client_contact.save

  redirect to("/client_contacts/#{client_contact.id}")
end

delete '/client_contacts/:id' do
  client_contact = ClientContacts.find(params[:id])
  client_contact.destroy #would make sense to change a status to inactive as will need to keep details on record.
  redirect to('/dashboard')
end

get '/client_contacts/:id' do
  redirect to '/' unless logged_in?
  @client_contact = ClientContact.find(params[:id])
  erb :'client_contacts/client_contact'
end