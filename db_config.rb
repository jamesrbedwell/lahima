require 'active_record'

options = {
  adapter: 'postgresql',
  database: lahima'
}

ActiveRecord::Base.establish_connection(options)