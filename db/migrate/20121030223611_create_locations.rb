class CreateLocations < ActiveRecord::Migration
  def self.up
    create_table :locations do |t|
	  t.string "name", :limit => 25
	  t.string "address", :limit => 50
	  t.float "lng"
	  t.float "lat"
      t.timestamps
    end
	def  self.down
		drop_table :locations
	end
	
  end
end
