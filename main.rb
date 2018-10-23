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






