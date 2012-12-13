class LocationsController < ApplicationController
	def list
	lat = params[:lat].to_s
	lng = params[:lng].to_s
	dst = params[:dst].to_s
	typ = params[:type].to_s
	if typ == ""
		@locations = Locations.within(dst, :origin => [lat,lng])
	else
		@locations = Locations.within(dst, :origin => [lat,lng]).where("bar_type= ?", typ)
	end
	@locations.sort_by_distance_from([lat,lng])
	# 32.649775,-97.161112
	#url should look like: http://example.com/locations/list?dst=5&lat=32.649775&lng=-97.161112&type=BAR for one type or
	# http://example.com/locations/list?dst=5&lat=32.649775&lng=-97.161112&type= for all types at once
	 
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
	#url should look like: http://localhost:3000/locations/createweb?name=Triniy Hall&address=5321 East Mockingbird Lane&bar_type=pub&subtype=dive&description=This is another trinity test
	end
end
