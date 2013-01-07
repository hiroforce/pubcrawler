class CreateBeers < ActiveRecord::Migration
  def self.up
    create_table :beers do |t|
	  t.integer "brewery_id"
	  t.string "name", :limit => 500
	  t.integer "cat_id"
	  t.integer "style_id"
	  t.integer "abv"
	  t.text "desc"
      t.timestamps
    end
	 create_table :beer_categories do |t|
	  t.string "name", :limit => 20
    end
	 create_table :beer_styles do |t|
	  t.integer "cat_id"
	  t.string "name", :limit => 20
    end
	def  self.down
		drop_table :beers
		drop_table :beer_categories
		drop_table :beer_styles
	end
	
  end
end
