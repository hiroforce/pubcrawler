class Beers < ActiveRecord::Base
	belongs_to :breweries
	
	scope :alphabetically, order("name ASC")
end
