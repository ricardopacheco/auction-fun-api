source "https://rubygems.org"

ruby "3.3.0"

# Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
gem "rails", "7.1.3.2"

# Use postgresql as the database for Active Record
gem "pg", "1.5.6"

# Use the Puma web server [https://github.com/puma/puma]
gem "puma", "6.4.2"

# Reduces boot times through caching; required in config/boot.rb
gem "bootsnap", require: false

# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin Ajax possible
gem "rack-cors", "2.0.2"

# Projects required load environments before rails load
gem 'dotenv-rails', "3.1.0", require: 'dotenv/load', groups: %i[development test]

# AuctionFunCore
# gem 'auction_fun_core', "0.8.3"
gem 'auction_fun_core', path: '../auction_fun_core', require: 'auction_fun_core'

group :development, :test do
  gem 'pry-rails'
end

group :development do
  # Speed up commands on slow machines / big apps [https://github.com/rails/spring]
  # gem "spring"
end

