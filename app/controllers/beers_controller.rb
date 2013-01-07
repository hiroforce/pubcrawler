class BeersController < ApplicationController
	
	def list
		@beers = Beers.alphabetically
		
	end

end
