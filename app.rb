require "rubygems"
require "bundler/setup"
require "sinatra"
$LOAD_PATH.unshift File.dirname(__FILE__)
require "registration"

get "/" do
  erb :index
end

get "/register" do
  @registration = Registration.new
  erb :register
end

post "/register" do
  @registration = Registration.new(params[:registration])
  if @registration.save
    erb :registered
  else
    @errors = @registration.errors
    erb :register
  end
end
