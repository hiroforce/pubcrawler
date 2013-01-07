class CreateBreweries < ActiveRecord::Migration
   def self.up
    create_table :breweries do |t|
	  t.string "name", :limit => 500
	  t.string "address1", :limit => 500
	  t.string "address2", :limit => 500
	  t.string "city", :limit => 50
	  t.string "state", :limit => 50
	  t.integer "code", :limit => 15
	  t.string "country", :limit => 50
	  t.string "phone", :limit => 50
	  t.string "website", :limit => 500
	  t.text "desc"
      t.timestamps
    end
	 create_table :breweries_geocode do |t|
	  t.integer "brewery_id", :limit => 15
	  t.float "lattitude"
	  t.float "longitude"
	  t.string "accuracy", :limit => 20
      t.timestamps
    end
	def  self.down
		drop_table :breweries
		drop_table :breweries_geocode
	end
	
  end
end
