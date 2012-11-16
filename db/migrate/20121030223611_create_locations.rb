class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
	  t.string "name", :limit => 25
	  t.string "address", :limit => 50
	  t.integer "lng"
	  t.integer "lat"
      t.timestamps
    end
  end
end
