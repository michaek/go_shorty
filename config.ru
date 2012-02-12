require 'go_shorty'

set :env,      :production
disable :run, :reload

run GoShorty::Application
