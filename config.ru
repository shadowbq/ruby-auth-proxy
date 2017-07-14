$LOAD_PATH << '.'

require 'rubygems'
require 'bundler'

Bundler.require

require 'sinatra'
require 'sinatra/param'
require 'sinatra/strong-params'

require 'rack/csrf'
require 'rack/protection'

Bundler.require(:default, ENV['RACK_ENV'].to_sym)  # only loads environment specific gems
if ENV['RACK_ENV'] == 'production'           # production config / requires
  true
else
  require 'pry'
  require 'pry-byebug'
  use Rack::ShowExceptions
end
use Rack::Session::Cookie, :key => 'rack.session',
                         :path => '/',
                         :secret => 'your_secret'
use Rack::Csrf, :raise => true
use Rack::Protection


require './app'

run SinatraAuthProxy
