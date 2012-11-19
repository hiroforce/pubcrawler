class LocationsController < ApplicationController
	def list
	lat = params[:lat].to_s
	lng = params[:lng].to_s
	
	 @locations = Locations.within(25, :origin => [lat,lng])
	# 32.649775,-97.161112
	#url should look like: http://example.com/locations/list?lat=32.649775&lng=-97.161112
	 
	end
	
	def listweb
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
	
	def createweb
	
	 
	name = params[:name]
	address = params[:address]
	bar_type = params[:bar_type]
	subtype = params[:subtype]
	description = params[:description]
	if bar_type == 'pub'
		icon = 'http://frankmilne.com/pubimages/pub.png'
	elsif bar_type == 'lounge'
		icon = 'http://frankmilne.com/pubimages/lounge.png'
	elsif bar_type == 'wine'
		icon = 'http://frankmilne.com/pubimages/wine.png'
	end
   

	
	@location = Locations.new(:name => name, :address => address, :description => description, :bar_type => bar_type, :subtype => subtype, :icon => icon)
	
	loc=Geokit::Geocoders::MultiGeocoder.geocode(@location.address)
	 
	@location.lng = loc.lng
	@location.lat = loc.lat
	@location.save
	# 32.649775,-97.161112
	#url should look like: http://example.com/locations/create?name=new bar&address=1900 pa ave,washington,dc&lat=32.649775&lng=-97.161112
	end
end
