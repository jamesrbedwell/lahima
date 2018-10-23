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

# SESSION ROUTES
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

# DASHBOARD ROUTES
get '/dashboard' do
  redirect to '/' unless logged_in?
  @user = User.find(current_user.id)
  erb :dashboard
end

# WORKER ROUTES
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
  worker.post_code = params[:psot_code]
  worker.user_id = current_user.id
  worker.save

  redirect to("/workers/#{worker.id}")
end

get '/workers/:id' do
  redirect to '/' unless logged_in?
  @worker = Worker.find(params[:id])
  erb :worker
end

# CLIENT ROUTES
get '/clients/:id' do
  redirect to '/' unless logged_in?
  @client = Client.find(params[:id])
  erb :client
end


#CLIENT CONTACT ROUTES
get '/client_contacts/:id' do
  redirect to '/' unless logged_in?
  @client_contact = ClientContact.find(params[:id])
  erb :client_contact
end







