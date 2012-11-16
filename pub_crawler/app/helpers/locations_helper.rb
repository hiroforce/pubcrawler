module LocationsHelper

def locations_as_json(locations)
  locations.collect do |location|
    {
      :name => location.name,
      :address => location.address,
    }
  end.to_json
end


end
