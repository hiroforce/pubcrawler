class Expandlocation < ActiveRecord::Migration
  def up
	add_column("locations", "bar_type", :string, :limit => 10)
	add_column("locations", "subtype", :string, :limit => 50)
	add_column("locations", "description", :text)
	add_column("locations", "icon", :string, :limit => 100)
  end

  def down
	remove_column("locations", "bar_type")
	remove_column("locations", "subtype")
	remove_column("locations", "description")
	remove_column("locations", "icon")
  end
end


