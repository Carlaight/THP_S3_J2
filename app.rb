require 'bundler'
Bundler.require

$:.unshift File.expand_path('./../lib', __FILE__)
require 'app/scrapper.rb'
require 'views/index.rb'




launch = Menu.new.choice




#Sheet = Scrapper.new.save_as_spreadsheet

# JSON = Scrapper.new.save_as_JSON

# CSV = Scrapper.new.save_as_csv