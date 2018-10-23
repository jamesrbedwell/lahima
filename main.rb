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





