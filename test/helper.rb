require 'minitest/autorun'
require 'minitest/colorize'

begin
  require 'bundler/setup'
  Bundler.require(:default, :development, :test)
rescue LoadError
  puts 'You must `gem install bundler` and `bundle install` to run rake tasks'
end

