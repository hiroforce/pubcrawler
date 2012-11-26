class Locationphone < ActiveRecord::Migration
  def up
	add_column("locations", "phone", :string, :limit => 50)
	add_column("locations", "web", :string, :limit => 50)
  end

  def down
	remove_column("locations", "phone")
	remove_column("locations", "web")
  end
end
