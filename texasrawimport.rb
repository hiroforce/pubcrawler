#!/usr/bin/ruby
#
require 'csv'
require 'mysql'
require 'geokit'
include Geokit::Geocoders

my = Mysql::init()
# You can do any SSL stuff before the real_connect
# args: hostname, username, password, database
my.real_connect("127.0.0.1", "root", "", "pub_crawl")

#Smy.query("DELETE FROM locations")

CSV.foreach("import.csv") do |row|
	zip = row[9].to_s[0..4]
  add =  row[3] + " " + row[4] + ", " + row[7] + ", " + row[8] + " " + zip
  

 
  loc=Geokit::Geocoders::MultiGeocoder.geocode(add)
  lng = loc.lng.to_s
  lat = loc.lat.to_s
 # p add
 p "add entry"
  my.query("INSERT INTO locations (name, address, phone, lng, lat) VALUES ('"+ row[1] + "','" + add + "','" + row[10] + "','" + lng + "','" + lat + "')")
end

