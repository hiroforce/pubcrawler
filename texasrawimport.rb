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

CSV.foreach("locations2.csv") do |row|
	
 # p add
 p "add entry"
  my.query("INSERT INTO locations (name, address, lng, lat, created_at, updated_at, bar_type, subtype, description, icon, phone, web ) VALUES ('"+ row[1] + "','" + row[2]  + "','" + row[3] + "','" + row[4] + "','"  + row[5] + "','"  + row[6] + "','"  + row[7] + "','"  + row[8] + "','"  + row[9] + "','"  + row[10] + "','" + row[11] + "','" + row[12] +  "')")
end

