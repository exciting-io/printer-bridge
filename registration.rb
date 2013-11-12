require "data_mapper"

# If you use PostgreSQL, you'll be able to deploy to Heroku easily.
# Otherwise, change this if you like.
#
# To create a local PostgreSQL database, run `createdb printer-bridge`
database_url = ENV['DATABASE_URL'] || "postgres://localhost/printer-bridge"
DataMapper::setup(:default, database_url)

class Registration
  include DataMapper::Resource
  property :id, Serial
  property :print_url, String, length: 255, unique: true,
           messages: {
             is_unique: "It looks like this printer is already registered."
           }
  property :content_url, String, length: 255
  property :delivery_count, Integer, default: 0

  def update_delivery_count
    update(delivery_count: self.delivery_count + 1)
  end
end

# Perform basic sanity checks and initialize all relationships
DataMapper.finalize
Registration.auto_upgrade!
