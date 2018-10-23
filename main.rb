require 'sinatra'
require 'sinatra/reloader'
require 'pg'
require 'pry'

require_relative 'db_config'
require_relative 'models/user' 
require_relative 'models/client' 
require_relative 'models/client_contact' 
require_relative 'models/worker' 
require_relative 'models/job' 
require_relative 'models/project' 

enable :sessions

helpers do 

  def logged_in?
    !!current_user
  end

  def current_user
    User.find_by(id: session[:user_id])
  end

end

get '/' do
  erb :index, layout: false
end

# -------- SESSION ROUTES --------
post '/session' do
  #authenticate
  user = User.find_by(email: params[:email])
  #if user exists and the password is correct, take them to dashboard page.
  if user && user.authenticate(params[:password])
    session[:user_id] = user.id
    redirect to("/dashboard")
  #redirect
  else  
    erb :index
  end
end

delete '/session' do 
  # destory session
  session[:user_id] = nil
  # redirect
  redirect to('/')
end

# -------- DASHBOARD ROUTES --------
get '/dashboard' do
  redirect to '/' unless logged_in?
  @user = User.find(current_user.id)
  erb :dashboard
end

# -------- WORKER ROUTES --------
get '/workers/new' do
  redirect to '/' unless logged_in?
  erb :new_worker
end

post '/workers' do
  worker = Worker.new
  worker.first_name = params[:first_name]
  worker.last_name = params[:last_name]
  worker.phone = params[:phone]
  worker.email = params[:email]
  worker.worker_type = params[:worker_type]
  worker.pay_rate = params[:pay_rate]
  worker.address1 = params[:address1]
  worker.city = params[:city]
  worker.state = params[:state]
  worker.country = params[:country]
  worker.post_code = params[:post_code]
  worker.user_id = current_user.id
  worker.save

  redirect to("/workers/#{worker.id}")
end

get '/workers/:id/edit' do
  redirect to '/' unless logged_in?
  @worker = Worker.find(params[:id])
  erb :edit_worker
end

put '/workers/:id' do
  worker = Worker.find(params[:id])
  worker.first_name = params[:first_name]
  worker.last_name = params[:last_name]
  worker.phone = params[:phone]
  worker.email = params[:email]
  worker.worker_type = params[:worker_type]
  worker.pay_rate = params[:pay_rate]
  worker.address1 = params[:address1]
  worker.city = params[:city]
  worker.state = params[:state]
  worker.country = params[:country]
  worker.post_code = params[:post_code]
  worker.user_id = current_user.id
  worker.save

  redirect to("/workers/#{worker.id}")
end

delete '/workers/:id' do
  @worker = Worker.find(params[:id])
  @worker.destroy #would make sense to change a status to inactive as will need to keep details on record.
  redirect to('/dashboard')
end

get '/workers/:id' do
  redirect to '/' unless logged_in?
  @worker = Worker.find(params[:id])
  erb :worker
end

# -------- CLIENT ROUTES --------
get '/clients/new' do
  redirect to '/' unless logged_in?
  erb :new_client
end

post '/clients' do
  client = Client.new
  client.entity_name = params[:entity_name]
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

get '/clients/:id/edit' do
  redirect to '/' unless logged_in?
  @client = Client.find(params[:id])
  erb :edit_client
end

post '/clients/:id' do
  client = Client.find(params[:id])
  client.entity_name = params[:entity_name]
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
  erb :client
end


# -------- CLIENT CONTACT ROUTES --------
get '/client_contacts/new' do
  redirect to '/' unless logged_in?
  erb :new_client_contact
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
  erb :edit_client_contact
end

post '/client_contacts/:id' do
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
  erb :client_contact
end







