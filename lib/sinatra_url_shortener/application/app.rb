require 'rubygems'
require 'sinatra'
require 'sinatra/activerecord'
require 'erb'
require 'base58'

# Used local version instead as current sinatra/authorization gem doesn't work with sinatra 1.0
require 'sinatra_url_shortener/application/authorization'

#App Files

# require 'sinatra_url_shortener/application/settings'
require 'sinatra_url_shortener/application/helpers'
# require 'sinatra_url_shortener/application/models'

module SinatraUrlShortener
  class Application < Sinatra::Base
    
    include SinatraUrlShortener::Helpers
    include Sinatra::Authorization
    
    # Creation
    get '/' do
      erb :index
    end

    post '/' do
      login_required
      @short_url = ShortUrl.new(:url => params[:url])
      if @short_url.save
        redirect "/success/#{@short_url.key}"
      else
        erb :error
      end
    end

    get '/success/:key' do |key|
      @short_url = ShortUrl.find_by_key(key)
      erb :success
    end

    # Redirection
    get %r{^/l/([a-zA-Z0-9]+)} do |key|
      if @short_url = ShortUrl.find_by_key(key)
        @short_url.click(request.referer)
        redirect @short_url.url
      else
        raise Sinatra::NotFound
      end
    end

    # Admin
    get '/admin' do
      login_required
      @short_urls = ShortUrl.all
      erb :admin
    end

    get '/admin/clicks/:key' do |key|
      login_required
      @short_url = ShortUrl.find_by_key(key)
      erb :admin_clicks
    end

  end
end
