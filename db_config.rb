require 'pg'
require 'active_record'
require_relative 'models/trot'
require_relative 'models/trip'
require_relative 'models/comment'

options = {
  adapter: 'postgresql', 
  database: 'plotatrot',
  username: 'mia' #only Ubuntu 
}

#ActiveRecord::Base.establish_connection(options)

ActiveRecord::Base.establish_connection( ENV['DATABASE_URL'] || options)