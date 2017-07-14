require 'bundler'
Bundler.require
require 'net/http'

# load the Database and User model
require_relative 'lib/model'
require_relative 'lib/strategies'

class SinatraAuthProxy < Sinatra::Base
  register Sinatra::StrongParams
  register Sinatra::Flash
  helpers Sinatra::Param

  #require 'pry'
  #binding.pry
  #

end

require_relative 'config/warden'
require_relative 'routes/init'
