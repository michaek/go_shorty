require 'go_shorty'

require 'rubygems'
require 'sinatra'
require 'rack/test'
require 'rspec'
require 'base64'

# set test environment
set :environment, :test
set :run, false
set :raise_errors, true
set :logging, false

RSpec.configure do |conf|
  conf.include Rack::Test::Methods
end
