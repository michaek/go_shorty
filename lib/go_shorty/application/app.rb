require 'rubygems'
require 'sinatra'
require 'haml'
require 'base58'
require 'sinatra/activerecord'

#App Files
require 'go_shorty/application/helpers'
require 'go_shorty/application/models'

module GoShorty
  class Application < Sinatra::Base
    
    include GoShorty::Helpers
    
    # Index
    get '/' do
      haml :index
    end

    # Redirection
    get %r{^/([a-zA-Z0-9]+)} do |key|
      if @short_url = ShortUrl.find_by_key(key)
        redirect @short_url.url
      else
        raise Sinatra::NotFound
      end
    end

  end
end
