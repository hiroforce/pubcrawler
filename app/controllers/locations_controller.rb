class LocationsController < ApplicationController
	def list
	lat = params[:lat].to_s
	lng = params[:lng].to_s
	
	 @locations = Locations.within(25, :origin => [lat,lng])
	# 32.649775,-97.161112
	#url should look like: http://example.com/locations/list?lat=32.649775&lng=-97.161112
	 
	end
	
	def create
	lat = params[:lat]
	lng = params[:lng]
	name = params[:name]
	address = params[:address]
	
	 c = Locations.create(:name => name, :address => address, :lat => lat, :lng  => lng)
	# 32.649775,-97.161112
	#url should look like: http://example.com/locations/create?name=new bar&address=1900 pa ave,washington,dc&lat=32.649775&lng=-97.161112
	end
end
