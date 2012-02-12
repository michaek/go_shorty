require "go_shorty/version"
require "go_shorty/application/app"

module GoShorty
  
  # TODO: provide routing helpers for rails.
  
  # Call from your Rails app to share the current database connection.
  def self.set_db_env
    dbconf = Rails.configuration.database_configuration[Rails.env].clone
    dbconf['adapter'] << '3' if dbconf['adapter'] = 'sqlite'
    dbconf['database'] << '.db' if dbconf['adapter'] = 'sqlite'
    dbconf['adapter'] << 'ql' if dbconf['adapter'] = 'postgres'

    dburi = {
      :scheme => dbconf['adapter'],
      :host => dbconf['database'],
      :userinfo => '%s:%s' % [dbconf['username'], dbconf['password']],
      :port => dbconf['port'],
      :arg_check => false
    }
    ENV['DATABASE_URL'] = URI::Generic.new( dburi[:scheme], dburi[:userinfo], dburi[:host], dburi[:port], nil, nil, nil, nil, nil).to_s
  end

end