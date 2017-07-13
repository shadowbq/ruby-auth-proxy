require 'bundler'
Bundler.require
require 'net/http'

# load the Database and User model
require_relative 'lib/model'
require_relative 'lib/strategies'

class SinatraAuthProxy < Sinatra::Base
  enable :sessions
  register Sinatra::StrongParams
  register Sinatra::Flash
  helpers Sinatra::Param

  #set :session_secret, "supersecret"

end

require_relative 'config/warden'
require_relative 'routes/init'
