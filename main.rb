require 'sinatra'
require 'sinatra/reloader'
require 'pg'

require_relative 'db_config'
require_relative 'models/user' 
require_relative 'models/client' 
require_relative 'models/client_contact' 
require_relative 'models/worker' 
require_relative 'models/job' 
require_relative 'models/project' 

get '/' do
  erb :index
end

get '/dashboard/:id' do
  @user = User.find(params[:id])
  erb :dashboard
end

post '/session' do
  #authenticate
  user = User.find_by(email: params[:email])
  #if user exists and the password is correct, take them to dashboard page.
  if user && user.authenticate(params[:password])
    session[:user_id] = user.id
    redirect to("/dashboard/#{user.id}")
  #redirect
  else  
    erb :login
  end
  
end






