module StaticLocationsHelper
  def static_locations
    StaticLocation::Location.locations
  end
end