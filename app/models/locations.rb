class Locations < ActiveRecord::Base
	acts_as_mappable
	has_many :beers
end
