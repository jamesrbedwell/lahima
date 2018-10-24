require 'sinatra'
require 'sinatra/reloader'
require 'pg'
require 'pry'

require_relative 'db_config'

# Models
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

# Routes
require_relative 'routes/client_contact_routes'
require_relative 'routes/client_routes'
require_relative 'routes/job_routes'
require_relative 'routes/project_routes'
require_relative 'routes/session_routes'
require_relative 'routes/worker_routes'
require_relative 'routes/dashboard_routes'






