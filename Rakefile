# This task can be run by CRON, or Heroku's Scheduler addon, to dispatch
# content to printers.

task :run do
  $LOAD_PATH.unshift File.dirname(__FILE__)
  require "registration"
  require "net/http"
  require "uri"
  puts "Running..."

  Registration.each do |registration|
    delivery_url = "#{registration.content_url}?delivery_count=#{registration.delivery_count}"
    puts "Processing job #{registration.id}: #{delivery_url} => #{registration.print_url}"
    Net::HTTP.post_form(URI.parse(registration.print_url), url: delivery_url)
    registration.update_delivery_count
  end
end
