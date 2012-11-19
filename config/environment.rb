# Load the rails application
require File.expand_path('../application', __FILE__)
include Geokit::Geocoders
# Initialize the rails application
PubCrawler::Application.initialize!

