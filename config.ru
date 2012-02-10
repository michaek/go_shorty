require 'sinatra_url_shortener'
# require File.join(File.dirname(__FILE__), 'lib/sinatra_url_shortener.rb')

# set :env,      :production
# disable :run, :reload

run SinatraUrlShortener::Application
