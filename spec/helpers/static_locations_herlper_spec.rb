require 'spec_helper'

describe StaticLocationsHelper do
  describe "static_locations" do
    it "should return an array of locations from the StaticLocation::Location class" do
      static_locations.should =~ StaticLocation::Location.locations
    end
  end
end