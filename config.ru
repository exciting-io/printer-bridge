require "rubygems"
require "bundler/setup"

$LOAD_PATH.unshift(".")
require "app"

run Sinatra::Application
